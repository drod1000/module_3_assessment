class SearchController < ApplicationController
  def index
    @zip_code = params[:zip_code]
    @response = BestBuyService.get_stores(@zip_code)
  end
end
