require 'faker'

5.times do |n|
  Group.create!(
    name: Faker::Internet.domain_name
  )
end

10.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.unique.password,
    group: Group.order('RAND()').first
  )
end
