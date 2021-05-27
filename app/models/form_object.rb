class FormObject
  include ActiveModel::Model
  attr_accessor :sipping_area_id,:city,:house_number,:building_number,:postalcode,:phone_number,:buyer_id,:user_id,:item_id ...

with_options presence: true do
  
  validates :sipping_area_id
  validates :city
  validates :house_number
  validates :postal_code
  validates :phone_number
  validates :buyer_id

end
 

  def save
  @adress = Adress.create
  @buyer = Buyer.create
  end

end