class CommitCoachController < ApplicationController
  def index
  end

  def create
    prompt = <<~PROMPT
      Eres un experto en Git.

      Describe estos cambios:

      #{params[:input]}

      Genera:

      - Commit siguiendo Conventional Commits
      - Explicación
      - Si procede, varios commits
    PROMPT

    result = GeminiClient.generate(prompt)

    @response = result.dig("candidates", 0, "content", "parts", 0, "text")

    render :index
  end
end