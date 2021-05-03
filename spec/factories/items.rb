FactoryBot.define do
  factory :item do
    name {Faker::Internet.username}
    explanation {explanation}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name {"山田"}
    last_name {"花子"}
    first_name_read {"ヤマダ"}
    last_name_read {"ハナコ"}
    born {Faker::Date.birthday}
  end
end