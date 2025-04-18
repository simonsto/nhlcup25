require 'rails_helper'

RSpec.describe "Matchups", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/matchups/index"
      expect(response).to have_http_status(:success)
    end
  end

end
