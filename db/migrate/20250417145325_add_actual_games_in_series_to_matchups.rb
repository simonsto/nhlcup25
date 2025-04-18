class AddActualGamesInSeriesToMatchups < ActiveRecord::Migration[8.0]
  def change
    add_column :matchups, :actual_games_in_series, :integer
  end
end
