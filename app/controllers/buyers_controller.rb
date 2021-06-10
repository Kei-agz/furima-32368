class BuyersController < ApplicationController
  before_action :set_item
  
  def index
    @form_object = FormObject.new
  end

  def new
    @buyer = Buyer.new
  end

  def create
    @form_object = FormObject.new(buyer_params)
     if @form_object.valid?
      Payjp.api_key = "sk_test_1cb3e263cccbbfdf25c6c9a3"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buyer_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @form_object.save
       redirect_to root_path
     else
       render action: :index
     end
  end
  private 

  def buyer_params
    params.require(:form_object).permit(:sipping_area_id, :city, :house_number, :building_number, :postal_code, :phone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def buyer_params2
    params.require(:form_object).permit(:price).merge(token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
