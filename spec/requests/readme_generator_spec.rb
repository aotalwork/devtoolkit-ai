require 'rails_helper'

RSpec.describe "ReadmeGenerators", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/readme_generator/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/readme_generator/create"
      expect(response).to have_http_status(:success)
    end
  end

end
