require 'rails_helper'

RSpec.describe "PrReviewers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/pr_reviewer/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/pr_reviewer/create"
      expect(response).to have_http_status(:success)
    end
  end

end
