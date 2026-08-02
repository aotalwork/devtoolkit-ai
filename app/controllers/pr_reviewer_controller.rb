class PrReviewerController < ApplicationController
  def index
  end

  def create
    prompt = <<~PROMPT
      Eres un Staff Software Engineer.

      Revisa este Pull Request:

      #{params[:input]}

      Analiza:

      - Legibilidad
      - Rendimiento
      - Seguridad
      - Arquitectura
      - Convenciones Rails

      Devuelve:

      ✅ Aspectos positivos

      ⚠️ Aspectos mejorables

      💡 Refactorizaciones

      ⭐ Puntuación final
    PROMPT

    result = GeminiClient.generate(prompt)

    @response = result.dig("candidates", 0, "content", "parts", 0, "text")

    render :index
  end
end
