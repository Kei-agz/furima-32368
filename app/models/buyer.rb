class Buyer < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one :address
  has_many :order


  

end
