require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /leaderboard" do
    it "returns http success" do
      get "/users/leaderboard"
      expect(response).to have_http_status(:success)
    end
  end

end
