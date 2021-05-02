class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :delivery_fee_id, :delivery_day_id, :price, :sipping_area_id)
  end
end
