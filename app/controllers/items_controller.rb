class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save 
      redirect_to root_path
    else 
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :delivery_fee_id, :delivery_day_id, :price, :sipping_area_id).merge(user_id: current_user.id)

  end
end
