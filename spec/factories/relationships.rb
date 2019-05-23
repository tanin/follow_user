FactoryBot.define do
  factory :relationship do
    association :follower, factory: :user, strategy: :create
    association :followed, factory: :user, strategy: :create
  end
end
