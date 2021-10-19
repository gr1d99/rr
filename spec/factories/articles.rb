FactoryBot.define do
  factory :article do
    title { Faker::Name.name }
    description { Faker::Lorem.paragraph }
  end
end