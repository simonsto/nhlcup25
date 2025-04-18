class AddUserGroupIdToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :user_group, null: false, foreign_key: true
  end
end
