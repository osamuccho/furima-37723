FactoryBot.define do
  factory :purchase_sending do
      token {"tok_abcdefghijk00000000000000000"}
      post_code { '123-4567' }
      prefecture_code_id {Faker::Number.between(from: 2, to: 48)}
      city {Faker::Address.city}
      house_number {Faker::Address.street_address}
      building_name { "横浜３４" }
      phone_number {"0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}"}
  end

  
end
