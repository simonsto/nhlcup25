ActiveAdmin.register Matchup do
  permit_params :round, :team_a_id, :team_b_id, :winner_id, :starts_at, :actual_games_in_series

  form do |f|
    f.inputs do
      f.input :round
      f.input :team_a
      f.input :team_b
      f.input :starts_at
      f.input :winner
      f.input :actual_games_in_series
    end
    f.actions
  end

  after_update do |matchup|
    PredictionScorer.new(matchup).call
  end
end
