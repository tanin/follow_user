FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password_digest { Faker::Crypto.unique.md5 }
  end
end
