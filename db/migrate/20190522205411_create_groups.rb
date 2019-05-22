class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false, index: { unique: true }, limit: 100

      t.timestamps
    end
  end
end
