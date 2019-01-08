FactoryBot.define do
  factory :message do
    email       { Faker::Internet.email }
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    amount      { Faker::Number.decimal(2) }
  end
end
