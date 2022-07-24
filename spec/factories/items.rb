FactoryBot.define do
  factory :item do
    item_name { 'あ' }
    introduction { 'あ' }
    price { 300 }
    delivery_days_id { 2 }
    item_condition_id { 2 }
    postage_payer_id { 2 }
    prefecture_code_id { 2 }
    category_id { 2 }

    association :user

    # アクティブストレージRspec
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
