class SqlOptimizerController < ApplicationController
  def index
  end

  def create
    prompt = <<~PROMPT
      Eres un experto en optimización SQL.

      Analiza:

      #{params[:input]}

      Explica:

      - Qué hace
      - Problemas
      - Índices recomendados
      - Optimización
      - Consulta mejorada
    PROMPT

    result = GeminiClient.generate(prompt)

    @response = result.dig("candidates", 0, "content", "parts", 0, "text")

    render :index
  end
end
