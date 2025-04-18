class AddScoreAwardedToPredictions < ActiveRecord::Migration[8.0]
  def change
    add_column :predictions, :score_awarded, :integer
  end
end
