class CreatePredictions < ActiveRecord::Migration[8.0]
  def change
    create_table :predictions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :matchup, null: false, foreign_key: true
      t.integer :predicted_winner_id
      t.integer :games_in_series

      t.timestamps
    end
  end
end
