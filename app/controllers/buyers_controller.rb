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
      @form_object.save
       redirect_to action: :index
     else
       render action: :index
     end
  end
  private 

  def buyer_params
    params.require(:form_object).permit(:sipping_area_id, :city, :house_number, :building_number, :postal_code, :phone_number, :buyer_id).merge(user_id: current_user.id)
  end
  
  
  def set_item
    @item = Item.find(params[:item_id])
  end

end
