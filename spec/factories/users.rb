FactoryBot.define do
  factory :user do
    name              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6,mix_case: false)}
    password_confirmation {password}
    family_name{'ア'}
    first_name{'ア'}
    family_name_kana{'ア'}
    first_name_kana{'ア'}
    birthday{'1996-02-27'}
  end
end