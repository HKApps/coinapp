class SendPriceNotificationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :send_price_notification, retry: false

  def perform(current_price)
    current_price  = current_price.to_d
    previous_price = PriceHistory.second_to_last.try(:price)

    return unless previous_price

    schedules = current_price > previous_price ? Schedule.greater(current_price) : Schedule.lesser(current_price)

    schedules.each do |schedule|
      comp_text = schedule.comparison == '>' ? 'above' : 'below'
      message   = <<-eos
        The BTC price is now $#{current_price}.

        You requested an sms when the price went #{comp_text} $#{schedule.price}.

        - CoinCoin Team
      eos

      twilio_account.sms.messages.create(
        from: Rails.configuration.twilio_number,
        to:   schedule.user.phone_number,
        body: message
      )

      CreateCompletedActionsWorker.perform_async(schedule.id, current_price)
    end

    schedules.update_all(enabled: false)
  end

  private

  def twilio_account
    @twilio_account ||= Twilio::REST::Client.new(twilio_account_sid, twilio_auth_token).account
  end

  def twilio_account_sid
    Rails.configuration.twilio_account_sid
  end

  def twilio_auth_token
    Rails.configuration.twilio_auth_token
  end
end
