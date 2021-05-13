class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])

    unless @item.user.id == current_user.id
      redirect_to action: :index
    end
  end


    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to item_path(@item.id)
      else
        render :edit
      end
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
