class CoinbaseClient
  attr_reader :coinbase

  def initialize
    @coinbase = Coinbase::Client.new(
      ENV['COINBASE_API_KEY'],
      ENV['COINBASE_API_SECRET']
    )
  end

  def get_price
    coinbase.buy_price(1).to_f
  end
end
