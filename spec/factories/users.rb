FactoryBot.define do
  factory :user do
    name { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name { 'ア' }
    first_name { 'ア' }
    family_name_kana { 'ア' }
    first_name_kana { 'ア' }
    birthday { '1996-02-27' }
  end
end
