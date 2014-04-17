load 'lib/coinbase_spot_price.rb'

class SendPriceNotificationWorker
  include Sidekiq::Worker
  include ActionView::Helpers
  sidekiq_options queue: :send_price_notification, retry: false

  def perform(current_price)
    current_price  = current_price.to_f.to_d
    previous_price = PriceHistory.second_to_last.try(:price)

    return unless previous_price

    schedules = current_price > previous_price ? Schedule.greater(current_price) : Schedule.lesser(current_price)
    s_notification = schedules.where(schedule_type: "notify")
    s_buy = schedules.where(schedule_type: "buy")
    s_sell = schedules.where(schedule_type: "sell")

    s_notification.each do |schedule|
      comp_text = schedule.comparison == '>' ? 'above' : 'below'
      message   = <<-eos
        The BTC price is now #{number_to_currency current_price}.

        You requested an sms when the price went #{comp_text} #{number_to_currency schedule.price}.

        - CoinCoin Team
      eos

      twilio_account.messages.create(
        from: Rails.configuration.twilio_number,
        to:   "+1#{ schedule.user.phone_number }",
        body: message
      )

      CreateCompletedActionsWorker.perform_async(schedule.id, current_price)
    end

    schedules.update_all(enabled: false)
  end

  # TODO update for authed user
  s_buy.each do |schedule|
    coinbase.buy(1) if coinbase.spot_price < schedule.price
  end

  # TODO update for authed user
  s_sell.each do |schedule|
    coinbase.sell(1) if coinbase.spot_price > schedule.price
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

  def coinbase
    @coinbase ||= Coinbase::Client.new(api_key, api_secret)
  end

  def api_key
    Rails.configuration.coinbase_api_key
  end

  def api_secret
    Rails.configuration.coinbase_api_secret
  end
end
