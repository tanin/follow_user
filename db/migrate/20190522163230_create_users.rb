class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :group_id, index: true
      t.string :name, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }, limit: 100
      t.string :password_digest

      t.timestamps
    end
  end
end
