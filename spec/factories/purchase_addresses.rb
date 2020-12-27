FactoryBot.define do
  factory :purchase_address do
    postal_code            { '000-0000' }
    prefecture_id          { 2 }
    city                   { '札幌' }
    address1               { Faker::Name.initials(number: 2) }
    address2               { Faker::Name.initials(number: 2) }
    telephone              { '00012345678' }
    user_id                { 1 }
    item_id                { 1 }
    purchase_id            { 1 }
  end
end
