RSpec.configure do |config|
  config.before(:suite) do
    Faker::Name.unique.clear
  end
end

