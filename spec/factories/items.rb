FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    category_id { rand(2..11) }
    condition_id { rand(2..7) }
    cost_burden_id { rand(2..3) }
    prefecture_id { rand(2..48) }
    shipping_days_id { rand(2..4) }
    price { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
