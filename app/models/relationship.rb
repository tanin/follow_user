class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User', counter_cache: true

  validates :follower, presence: true, uniqueness: { scope: :followed }
  validates :followed, presence: true
end
