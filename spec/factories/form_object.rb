FactoryBot.define do
  factory :form_object do
    sipping_area_id {4}
    city {Faker::Address.city}
    house_number {"215"}
    building_number {Faker::Address.building_number}
    postal_code {"345-3546"}
    phone_number {"07523488733"}
    token {"4jiw48"}
  end
end
