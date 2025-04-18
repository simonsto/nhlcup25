class Matchup < ApplicationRecord
  has_many :predictions
  belongs_to :team_a, class_name: "Team"
  belongs_to :team_b, class_name: "Team"
  belongs_to :winner, class_name: "Team", optional: true

  def east?
    team_a.conference == "East" || team_b.conference == "East"
  end

  def west?
    team_a.conference == "West" || team_b.conference == "West"
  end
end
