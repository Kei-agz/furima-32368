class Adress < ApplicationRecord
  belongs_to :buyer

  with_options presence: true do
    validates :sipping_area_id
    validates :city
    validates :house_number
    validates :postal_code
    validates :phone_number
    validates :buyer_id
  
  end

end
