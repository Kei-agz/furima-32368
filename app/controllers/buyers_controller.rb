class BuyersController < ApplicationController
  def index
    @form_object = FormObject.new
  end

  def new
    @buyer = Buyer.new
  end

  def create
     if @buyer.valid?
       @buyer.save
       redirect_to action: :index
     else
       render action: :new
     end

     private
    def buyer_params
     params.require(:user_address).permit(:nickname, :last_name, :first_name, :last_name_read, :first_name_read, :born)
    end
end