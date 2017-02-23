FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentence
    image_url Faker::Lorem.sentence
  end
end
