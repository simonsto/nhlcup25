class MatchupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @matchups_by_round = Matchup.includes(:team_a, :team_b).group_by(&:round)
  end
end
