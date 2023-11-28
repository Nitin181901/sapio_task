class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all
  end

  def convert
    api_key = 'e117dfca22c8c84f6c888aad9cec2a44' 
    converter = CurrencyConverter.new(api_key)

    return if params[:amount].blank?

    @base_currency = params[:base_currency]
    @target_currency = params[:target_currency]
    @amount = params[:amount].to_f

    @converted_amount = converter.live_exchange_rate(@base_currency, @target_currency) * @amount
    respond_to do |format|
      format.html { render 'index' } # Add this line if you still want to handle HTML requests
      format.json { render json: { converted_amount: @converted_amount } }
    end
  end

  def historical_chart
    api_key = 'e117dfca22c8c84f6c888aad9cec2a44'
    converter = CurrencyConverter.new(api_key)
return if params[:base_currency].blank?
    base_currency = params[:base_currency]
    target_currency = params[:target_currency]
    start_date = params[:start_date]
    end_date = params[:end_date]

    historical_rates = converter.historical_exchange_rate(base_currency, target_currency, start_date, end_date)
    historical_array = historical_rates.map do |date, data|
    [date, data["#{base_currency}#{target_currency}"]]
  end
  @sorted_historical_array = historical_array.sort_by { |date, _| date }

    puts "API Response: #{@historical_rates.inspect}"
  end
end