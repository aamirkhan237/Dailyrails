# spec/factories/products.rb
FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
    status { :active } 
  end
end
