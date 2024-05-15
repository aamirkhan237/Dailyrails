FactoryBot.define do
  factory :order do
    user { nil }
    state { "MyString" }
    total_price { "9.99" }
    address { nil }
  end
end
