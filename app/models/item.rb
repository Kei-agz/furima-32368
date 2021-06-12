class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_one :buyer

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :sipping_area

  with_options presence: true do
    # presence:trueのみ適用されるカラムを書き出す

    validates :explanation

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :delivery_day_id
      validates :sipping_area_id
    end
  end
  validates :name, presence: true, length: { maximum:40 }
  validates :price,  presence: true, length: { minimum: 3, maximum: 7 },numericality: { only_integer: true,
    greater_than_or_equal_to: 300, less_than: 10000000 }, format: { with: /\A[0-9]+\z/ }

end
