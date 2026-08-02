require "rails_helper"

RSpec.describe "CodeExplainer", type: :request do
  describe "GET /code_explainer" do
    it "returns http success" do
      get code_explainer_index_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /code_explainer" do
    it "returns http success" do
      post code_explainer_index_path, params: {
        input: "def hello\n puts 'Hola'\nend"
      }

      expect(response).to have_http_status(:success)
    end
  end
end