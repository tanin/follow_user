class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, index: true, null: false
      t.integer :followed_id, index: true, null: false

      t.timestamps
    end

    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
