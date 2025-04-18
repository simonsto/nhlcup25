FactoryBot.define do
  factory :prediction do
    user { nil }
    matchup { nil }
    predicted_winner_id { 1 }
    games_in_series { 1 }
  end
end
