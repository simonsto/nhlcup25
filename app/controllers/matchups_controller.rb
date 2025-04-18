class MatchupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @matchups_by_round = Matchup.includes(:team_a, :team_b).group_by(&:round)
    @user_predictions_by_matchup_id = current_user.predictions.index_by(&:matchup_id)
  end
end
