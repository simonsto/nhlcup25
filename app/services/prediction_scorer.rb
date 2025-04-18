class PredictionScorer
  def initialize(matchup)
    @matchup = matchup
  end

  def call
    return unless @matchup.winner_id && @matchup.actual_games_in_series

    @matchup.predictions.each do |prediction|
      score = 0

      # Correct winner
      if prediction.predicted_winner_id == @matchup.winner_id
        score += 5

        # Bonus for correct number of games
        if prediction.games_in_series == @matchup.actual_games_in_series
          score += 2
        end
      end

      prediction.update(score_awarded: score)
      prediction.user.increment!(:score, score)
      prediction.user.user_group&.increment!(:score, score)
    end
  end
end
