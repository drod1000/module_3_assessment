class SearchController < ApplicationController
  def index
    @zip_code = params[:zip_code]
    @parsed = BestBuyService.get_stores(@zip_code)
    @stores = @parsed[:stores]
  end
end
