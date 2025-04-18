class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username, :string
    add_column :users, :favorite_team, :string
    add_column :users, :avatar, :string
    add_column :users, :score, :integer
  end
end
