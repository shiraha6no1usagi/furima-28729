FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    date                  { Faker::Date.between(from: '2000-09-10', to: '2014-09-25') }
    name                  { '陸太郎' }
    family_name           { '田中' }
    name_read             { 'リクタロウ' }
    family_name_read      { 'タナカ' }
  end
end
