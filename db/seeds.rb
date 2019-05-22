require 'faker'

10.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.unique.password
  )
end
