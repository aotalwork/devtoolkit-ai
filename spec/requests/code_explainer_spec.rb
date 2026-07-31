require 'rails_helper'

RSpec.describe "CodeExplainers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/code_explainer/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/code_explainer/create"
      expect(response).to have_http_status(:success)
    end
  end

end
