class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    @item = Item.create(item_params)
    render json: @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    render json: 201
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
