# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Create Teams
a1 = Team.find_or_create_by(name: "Toronto Maple Leafs")
wc1 = Team.find_or_create_by(name: "Ottawa Senators")
a2 = Team.find_or_create_by(name: "Tampa Bay Lightning")
a3 = Team.find_or_create_by(name: "Florida Panthers")
m1 = Team.find_or_create_by(name: "Washington Capitals")
wc2 = Team.find_or_create_by(name: "Montreal Canadiens")
m2 = Team.find_or_create_by(name: "Carolina Hurricanes")
m3 = Team.find_or_create_by(name: "New Jersey Devils")

# Round 1 Matchups
Matchup.find_or_create_by(
  round: 1,
  team_a: a1,
  team_b: wc1,
  starts_at: 3.days.from_now
)

Matchup.find_or_create_by(
  round: 1,
  team_a: a2,
  team_b: a3,
  starts_at: 3.days.from_now
)

Matchup.find_or_create_by(
  round: 1,
  team_a: m1,
  team_b: wc2,
  starts_at: 3.days.from_now
)

Matchup.find_or_create_by(
  round: 1,
  team_a: m2,
  team_b: m3,
  starts_at: 3.days.from_now
)
