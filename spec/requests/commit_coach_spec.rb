require 'rails_helper'

RSpec.describe "CommitCoaches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/commit_coach/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/commit_coach/create"
      expect(response).to have_http_status(:success)
    end
  end

end
