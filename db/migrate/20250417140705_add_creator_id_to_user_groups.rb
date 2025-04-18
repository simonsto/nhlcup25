class AddCreatorIdToUserGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :user_groups, :creator_id, :integer
    add_index :user_groups, :creator_id
  end
end
