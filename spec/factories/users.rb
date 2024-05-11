FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    mobile_number { Faker::PhoneNumber.cell_phone }
    location { Faker::Address.city }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    role { :user }
    trait :vendor do
      role { :vendor }
    end
  end
end
