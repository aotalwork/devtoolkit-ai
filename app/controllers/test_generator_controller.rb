class TestGeneratorController < ApplicationController
  def index
  end

  def create
    prompt = <<~PROMPT
      Eres un experto en testing automatizado.

      Analiza este código:

      #{params[:input]}

      Genera:

      - Tests completos
      - Casos límite
      - Casos inválidos
      - Explicación de cada test

      Usa RSpec si detectas Ruby on Rails.

      Responde en español y Markdown.
    PROMPT

    result = GeminiClient.generate(prompt)

    @response = result.dig("candidates", 0, "content", "parts", 0, "text")

    render :index
  end
end
