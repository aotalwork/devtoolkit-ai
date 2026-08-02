require "rails_helper"

RSpec.describe "CommitCoach", type: :request do
  describe "GET /commit_coach" do
    it "returns http success" do
      get commit_coach_index_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /commit_coach" do
    it "returns http success" do
      post commit_coach_index_path, params: {
        input: "def hello\n puts 'Hola'\nend"
      }

      expect(response).to have_http_status(:success)
    end
  end
end