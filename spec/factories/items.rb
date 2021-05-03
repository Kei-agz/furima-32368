FactoryBot.define do
  factory :item do
    name {Faker::book.title}
    explanation {"これはフィクションです。"}
    category_id {1}
    status_id {2}
    delivery_fee_id {4}
    sipping_area_id {33}
    delivery_day_id {3}
    price {499}
  end
end