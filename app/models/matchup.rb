class Matchup < ApplicationRecord
  has_many :predictions
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"
  belongs_to :winner, class_name: "Team", optional: true
end
