FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    tel { '09098765432' }
  end
end
