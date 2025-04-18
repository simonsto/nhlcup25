class AddLogoFilenameToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :logo_filename, :string
  end
end
