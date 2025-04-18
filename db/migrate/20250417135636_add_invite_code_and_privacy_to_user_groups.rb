class AddInviteCodeAndPrivacyToUserGroups < ActiveRecord::Migration[8.0]
  def change
    add_column :user_groups, :invite_code, :string
    add_column :user_groups, :is_private, :boolean, default: false
    add_index :user_groups, :invite_code, unique: true
  end
end
