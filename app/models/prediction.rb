class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :matchup
  belongs_to :predicted_winner, class_name: "Team"
end
