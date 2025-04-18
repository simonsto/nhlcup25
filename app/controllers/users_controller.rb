class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :my_picks ]

  def leaderboard
    @users = User.includes(:user_group).order(score: :desc)
  end

  def my_picks
    @predictions = current_user.predictions.includes(:matchup, :predicted_winner).order("matchups.round")
  end
end
