namespace :nhl do
  desc "Fetch and seed all NHL teams from NHL API"
  task seed_teams: :environment do
    require "net/http"
    require "json"

    url = URI("https://statsapi.web.nhl.com/api/v1/teams")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    data["teams"].each do |team_data|
      team = Team.find_or_initialize_by(name: team_data["name"])
      team.abbreviation = team_data["abbreviation"]
      team.conference   = team_data.dig("conference", "name")
      team.division     = team_data.dig("division", "name")
      team.logo_url     = "https://www-league.nhlstatic.com/images/logos/teams-current-primary-light/#{team_data["id"]}.svg"
      team.save!

      puts "Seeded: #{team.name} (#{team.conference})"
    end

    puts "✅ NHL teams seeded successfully!"
  end
end
