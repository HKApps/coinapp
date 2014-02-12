require 'coinbase'

module Coinbase
  class Client
    def spot_price qty=1
      r = get '/prices/spot_rate', {qty: qty}
      r['amount'].to_money(r['currency'])
    end
  end
end
