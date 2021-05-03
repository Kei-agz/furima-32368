class Item < ApplicationRecord

  belongs_to :user
  has_one :buyer
  has_one_attached :image


  with_options presence: true do
    # presence:trueのみ適用されるカラムを書き出す
   validates :name
   validates :explanation
   validates :category_id
   validates :status_id
   validates :delivery_fee_id
   validates :delivery_day_id
   validates :price
   validates :sipping_area_id

  end
end
