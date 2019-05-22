FactoryBot.define do
  factory :user do
    name { 'some_user' }
    password_digest { Faker::Crypto.md5 }
  end
end
