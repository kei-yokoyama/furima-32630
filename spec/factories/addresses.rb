FactoryBot.define do
  factory :address do
    postal_code            { '000-0000' }
    prefecture_id          { 2 }
    city                   { '札幌' }
    address1               { Faker::Name.initials(number: 2) }
    address2               { Faker::Name.initials(number: 2) }
    telephone              { '00012345678' }

    association :purchase
  end
end
