class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_cloud[:publishable_key],
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    begin
      price = client.price(ticker_symbol)
      name = client.company(ticker_symbol).company_name

      new(ticker: ticker_symbol, name: name, last_price: price)
    rescue StandardError
      nil
    end
  end
end
