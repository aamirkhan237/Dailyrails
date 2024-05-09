
FactoryBot.define do
  factory :cms_page do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end
