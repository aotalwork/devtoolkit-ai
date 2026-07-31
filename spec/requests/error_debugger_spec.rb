require 'rails_helper'

RSpec.describe "ErrorDebuggers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/error_debugger/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/error_debugger/create"
      expect(response).to have_http_status(:success)
    end
  end

end
