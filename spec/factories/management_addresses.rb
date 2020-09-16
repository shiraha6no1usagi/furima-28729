FactoryBot.define do
  factory :management_address do
    token         { "tok_hoge1234" }
    postal_code   { '123-4567' }
    prefecture    { 3 }
    city          { '横浜市緑区' }
    house_number  { '青山2-3' }
    building_name { '東京ハイツ' }
    phone_number  { '09012345678' }
  end
end
