FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '123456d' }
    password_confirmation { password }
    last_name             { '仲田' }
    first_name            { '太郎' }
    last_name_kana        { 'ナカタ' }
    first_name_kana       { 'タロウ' }
    birthday_year         { Faker::Date.birthday }
  end
end
