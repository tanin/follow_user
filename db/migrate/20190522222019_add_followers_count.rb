class AddFollowersCount < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :relationships_count, :integer, default: 0
  end
end
