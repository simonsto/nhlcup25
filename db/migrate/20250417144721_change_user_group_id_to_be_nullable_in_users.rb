class ChangeUserGroupIdToBeNullableInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :user_group_id, true
  end
end
