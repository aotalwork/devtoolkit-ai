require 'rails_helper'

RSpec.describe "SqlOptimizers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get sql_optimizer_index_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get sql_optimizer_index_path
      expect(response).to have_http_status(:success)
    end
  end
end
