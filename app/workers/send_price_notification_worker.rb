class SendPriceNotificationWorker
  include Sidekiq::Worker

  def perform(price)
    # E.G - Alert me when the price goes above 650: price > 650
    greater_schedules = Schedule.includes(:user).where(comparison: '>').where('? > price', price)

    # E.G - Alert me when the price goes below 650: price < 650
    lesser_schedules = Schedule.includes(:user).where(comparison: '<').where('? < price', price)

    total_schedules = greater_schedules + lesser_schedules

    total_schedules.each do |schedule|
      comp_text = schedule.comparison == '>' ? 'above' : 'below'

      twilio_account.sms.messages.create(
        from: Rails.configuration.twilio_number,
        to:   schedule.user.phone_number,
        message: <<-eos
        The BTC price is now #{price}.

        You requested an sms when the price went #{comp_text} $#{schedule.price}.

        - CoinCoin Team
        eos
      )

      CreateCompletedActionsWorker.perform_async(schedule_id, price)
    end

    total_schedules.update_all(enabled: false)
  end

  private

  def twilio_account
    @twilio_account ||= Twilio::REST::Client.new(twilio_sid, twilio_auth_token).account
  end

  def twilio_sid
    Rails.configuration.twilio_sid
  end

  def twilio_auth_token
    Rails.configuration.twilio_auth_token
  end
end
