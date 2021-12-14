FactoryBot.define do
  factory :item do
    name            {Faker::Name.name}
    concept         {"good"}
    price           {3000}
    category_id     {3}
    condition_id    {3}
    delivary_fee_id {3}
    prefecture_id   {3}
    delivary_day_id {3}
    association :user

    #trait :image do
      after(:build) do |item|
        #File.open("#{Rails.root}/spec/images/Unknown.jpeg") do |f|
          item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        #end
      #end
    end
  end
end
