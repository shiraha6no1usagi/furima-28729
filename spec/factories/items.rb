FactoryBot.define do
  factory :item do
    name                  { '商品の名前' }
    comment               { '商品の説明文' }
    category_id           { '2' }
    status_id             { '2' }
    delivery_fee_id       { '2' }
    shipping_origin_id    { '2' }
    shipping_day_id       { '2' }
    price                 { '3000' }
    association :user
  end
end
