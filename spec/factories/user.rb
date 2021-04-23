FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {"山田"}
    last_name {"花子"}
    first_name_read {"ヤマダ"}
    last_name_read {"ハナコ"}
    born {Faker::Date.birthday}
  end
end