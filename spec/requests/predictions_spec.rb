require 'rails_helper'

RSpec.describe "Predictions", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/predictions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/predictions/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
