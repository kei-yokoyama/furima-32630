FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    family_name           {"あ亜"}
    first_name            {"い伊"}
    family_name_kana      {"アア"}
    first_name_kana       {"イイ"}
    birthday              {Faker::Date.in_date_period(year: 1993, month: 1)}
  end
end