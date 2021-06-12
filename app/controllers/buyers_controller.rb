class BuyersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!,only:[:index]
  before_action :redirect_root
  
  def index

    @form_object = FormObject.new
  end


  def create
    @form_object = FormObject.new(buyer_params)
    if @form_object.valid?
      buy_items
     @form_object.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private 

  def buyer_params
    params.require(:form_object).permit(:sipping_area_id, :city, :house_number, :building_number, :postal_code, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    redirect_to root_path if @item.user.id == current_user.id || @item.buyer.present?
  end

  def buy_items
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

end
