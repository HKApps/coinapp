load 'lib/coinbase_spot_price.rb'

class UpdatePriceWorker
  include Sidekiq::Worker
  sidekiq_options queue: :update_price, retry: false

  def perform
    if PriceHistory.count == 0
      send_notification
    else
      send_notification if previous_price.price != current_price.price
    end
  end

  private

  def send_notification
    SendPriceNotificationWorker.perform_async(current_price.price)
  end

  def formatted_price
    coinbase.spot_price.fractional / 100
  end

  def previous_price
    PriceHistory.last
  end

  def current_price
    @new_ph ||= PriceHistory.create! price: formatted_price
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

