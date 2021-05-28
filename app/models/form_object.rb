class FormObject
  include ActiveModel::Model
  attr_accessor :sipping_area_id,:city,:house_number,:building_number,:postal_code,:phone_number,:buyer_id,:user_id,:item_id 

  
  with_options presence: true do

  validates :sipping_area_id
  validates :city
  validates :house_number
  validates :buyer_id
    
    with_options format: { with:/\A\d{3}[-]\d{4}\z/ } do
      validates :postal_code
    end
    with_options format: { with:/\A\d{11}\z/} do
      validates :phone_number
    end
  end
 

  def save
  buyer = Buyer.create(user_id: buyer.id, item_id: item.id)
  Address.create(sipping_area_id: sipping_area_id, city: city, house_number: house_number, buyer_id: buyer.id, postal_code: postal_code, phone_number: phone_number)

  end

end