load 'lib/coinbase_spot_price.rb'

class UpdatePriceWorker
  include Sidekiq::Worker

  def perform
    formatted_price = coinbase.spot_price.fractional / 100
    last_ph         = PriceHistory.last
    new_ph          = PriceHistory.create price: formatted_price

    SendPriceNotificationWorker.perform_async(new_ph.price) if last_ph.price != new_ph.price
  end

  private

  def coinbase
    @coinbase ||= Coinbase::Client.new(key, secret)
  end

  def api_key
    Rails.configuration.coinbase_api_key
  end

  def api_secret
    Rails.configuration.coinbase_api_secret
  end
end

