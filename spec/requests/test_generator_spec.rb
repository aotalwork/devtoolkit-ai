require "rails_helper"

RSpec.describe "TestGenerator", type: :request do
  describe "GET /code_explainer" do
    it "returns http success" do
      get test_generator_index_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /test_generator" do
    it "returns http success" do
      post test_generator_index_path, params: {
        input: "def hello\n puts 'Hola'\nend"
      }

      expect(response).to have_http_status(:success)
    end
  end
end
