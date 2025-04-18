class AddConferenceToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :conference, :string
  end
end
