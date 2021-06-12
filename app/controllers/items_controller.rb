class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_root, only: [:edit, :update, :destroy]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show

  end

  def edit

  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

    def update
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

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_root
    redirect_to root_path if @item.user.id != current_user.id || @item.buyer != nil
  end
end
