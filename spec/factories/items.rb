FactoryBot.define do
  factory :item do
    name {"コミック本"}
    explanation {Faker::Lorem.sentence}
    category_id {1}
    status_id {2}
    delivery_fee_id {4}
    sipping_area_id {33}
    delivery_day_id {3}
    price {499}
    image {Faker::Lorem.sentence}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open("public/images/test_image.jpg"), filename: 'test_image.jpg')
    end

  end
end