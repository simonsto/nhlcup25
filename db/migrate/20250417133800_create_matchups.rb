class CreateMatchups < ActiveRecord::Migration[8.0]
  def change
    create_table :matchups do |t|
      t.integer :round
      t.integer :team_a_id
      t.integer :team_b_id
      t.integer :winner_id
      t.datetime :starts_at

      t.timestamps
    end
  end
end
