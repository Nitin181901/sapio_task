class CurrencyConverter
  include HTTParty
  base_uri 'http://api.currencylayer.com'

  def initialize(api_key)
    @api_key = api_key
  end

  def live_exchange_rate(base_currency, target_currency)
    params = { access_key: @api_key, currencies: "#{target_currency}", source: base_currency }
    response = self.class.get('/live', query: params)

    puts "API Request URL: #{response.request.last_uri}"
    puts "API Response: #{response.body}"
    return nil if response['error']

    response['quotes']["#{base_currency}#{target_currency}"]
  end

  def historical_exchange_rate(base_currency, target_currency, start_date, end_date)
    response = self.class.get('/timeframe', query: { access_key: @api_key, currencies: "#{target_currency}", source: base_currency, start_date: start_date, end_date: end_date })
    puts "API Response: #{response.body}"
    
    return nil if response['error']

    response['quotes']
  end
end
