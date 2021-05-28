class Address < ApplicationRecord
  belongs_to :buyer
  has_one :order



end
