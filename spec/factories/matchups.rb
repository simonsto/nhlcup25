FactoryBot.define do
  factory :matchup do
    round { 1 }
    team_a_id { 1 }
    team_b_id { 1 }
    winner_id { 1 }
    starts_at { "2025-04-17 09:38:00" }
  end
end
