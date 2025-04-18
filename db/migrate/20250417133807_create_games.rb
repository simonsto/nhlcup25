class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.references :matchup, null: false, foreign_key: true
      t.integer :game_number
      t.integer :score_team_a
      t.integer :score_team_b
      t.string :result

      t.timestamps
    end
  end
end
