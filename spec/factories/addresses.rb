FactoryBot.define do
  factory :address do
    user { nil }
    name { "MyString" }
    street { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    country { "MyString" }
  end
end
