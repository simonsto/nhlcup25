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

puts "🌱 Seeding NHL Playoff Teams and Matchups..."

# WEST TEAMS
jets     = Team.create!(name: "Winnipeg Jets",       abbreviation: "WPG", conference: "West", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/52.svg")
blues    = Team.create!(name: "St. Louis Blues",     abbreviation: "STL", conference: "West", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/19.svg")
stars    = Team.create!(name: "Dallas Stars",        abbreviation: "DAL", conference: "West", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/25.svg")
avs      = Team.create!(name: "Colorado Avalanche",  abbreviation: "COL", conference: "West", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/21.svg")
knights  = Team.create!(name: "Vegas Golden Knights",abbreviation: "VGK", conference: "West", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/54.svg")
wild     = Team.create!(name: "Minnesota Wild",      abbreviation: "MIN", conference: "West", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/30.svg")
kings    = Team.create!(name: "Los Angeles Kings",   abbreviation: "LAK", conference: "West", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/26.svg")
oilers   = Team.create!(name: "Edmonton Oilers",     abbreviation: "EDM", conference: "West", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/22.svg")

# EAST TEAMS
leafs    = Team.create!(name: "Toronto Maple Leafs", abbreviation: "TOR", conference: "East", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/10.svg")
sens     = Team.create!(name: "Ottawa Senators",     abbreviation: "OTT", conference: "East", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/9.svg")
bolts    = Team.create!(name: "Tampa Bay Lightning", abbreviation: "TBL", conference: "East", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/14.svg")
panthers = Team.create!(name: "Florida Panthers",    abbreviation: "FLA", conference: "East", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/13.svg")
caps     = Team.create!(name: "Washington Capitals", abbreviation: "WSH", conference: "East", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/15.svg")
habs     = Team.create!(name: "Montreal Canadiens",  abbreviation: "MTL", conference: "East", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/8.svg")
canes    = Team.create!(name: "Carolina Hurricanes", abbreviation: "CAR", conference: "East", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/12.svg")
devils   = Team.create!(name: "New Jersey Devils",   abbreviation: "NJD", conference: "East", logo_url: "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/1.svg")

# MATCHUPS (Round 1)
Matchup.create!(round: 1, team_a: jets,     team_b: blues,    starts_at: 1.day.from_now)
Matchup.create!(round: 1, team_a: stars,    team_b: avs,      starts_at: 1.day.from_now)
Matchup.create!(round: 1, team_a: knights,  team_b: wild,     starts_at: 1.day.from_now)
Matchup.create!(round: 1, team_a: kings,    team_b: oilers,   starts_at: 1.day.from_now)

Matchup.create!(round: 1, team_a: leafs,    team_b: sens,     starts_at: 1.day.from_now)
Matchup.create!(round: 1, team_a: bolts,    team_b: panthers, starts_at: 1.day.from_now)
Matchup.create!(round: 1, team_a: caps,     team_b: habs,     starts_at: 1.day.from_now)
Matchup.create!(round: 1, team_a: canes,    team_b: devils,   starts_at: 1.day.from_now)

puts "✅ Seeded 16 teams and 8 Round 1 matchups."
