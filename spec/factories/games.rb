FactoryBot.define do
  factory :game do
    matchup { nil }
    game_number { 1 }
    score_team_a { 1 }
    score_team_b { 1 }
    result { "MyString" }
  end
end
