FactoryBot.define do
  factory :order_address do
    token           { 'sample_token' }
    postal_code     { '222-2222' }
    prefecture_id   { 3 }
    city            { '千葉県香取市' }
    lot_number      { '一ノ分目3093' }
    building        { 'アピオ' }
    phone_number    { '00011112222' }
  end
end
