class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all
  end

  def convert
    api_key = 'e117dfca22c8c84f6c888aad9cec2a44'
    converter = CurrencyConverter.new(api_key)

    base_currency = params[:base_currency]
    target_currency = params[:target_currency]
    amount = params[:amount].to_f

    @converted_amount = converter.live_exchange_rate(base_currency, target_currency) * amount
  end

  def historical_chart
    api_key = 'e117dfca22c8c84f6c888aad9cec2a44'
    converter = CurrencyConverter.new(api_key)

    base_currency = params[:base_currency]
    target_currency = params[:target_currency]
    start_date = params[:start_date]
    end_date = params[:end_date]

    @historical_rates = converter.historical_exchange_rate(base_currency, target_currency, start_date, end_date)
  end
end