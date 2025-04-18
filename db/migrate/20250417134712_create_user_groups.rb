class CreateUserGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :user_groups do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: { unique: true }
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
