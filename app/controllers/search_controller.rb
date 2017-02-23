class SearchController < ApplicationController
  def index
    zip_code = params[:zip_code]
    response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip_code},25))?format=json&show=storeType,name,city,distance,phone&pageSize=10&apiKey=#{ENV["BEST_BUY_API_KEY"]}"
    parsed = JSON.parse(response.body, symbolize_names: true)[:stores]
    @stores = parsed
    binding.pry
  end
end


# https://api.bestbuy.com/v1/stores(area(zip_code,25))?format=json&show=storeType,name,city,distance,phone&pageSize=10&apiKey=ENV[BEST_BUY_API_KEY]
