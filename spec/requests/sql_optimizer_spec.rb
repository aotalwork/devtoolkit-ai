require 'rails_helper'

RSpec.describe "SqlOptimizers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/sql_optimizer/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/sql_optimizer/create"
      expect(response).to have_http_status(:success)
    end
  end

end
