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

  rescue GeminiClient::GeminiError => e
    @response = case e.status
                when 503
                  "⚠️ El servicio de IA no está disponible temporalmente. Gemini está experimentando una alta demanda. Por favor, inténtalo de nuevo en unos segundos."
                when 429
                  "⚠️ Se ha alcanzado temporalmente el límite de solicitudes. Por favor, espera unos segundos e inténtalo de nuevo."
                when 401, 403
                  "⚠️ No se ha podido autenticar con el servicio de IA. Comprueba la configuración de GEMINI_API_KEY."
                else
                  "⚠️ No se ha podido procesar la solicitud con Gemini. Inténtalo de nuevo más tarde."
                end

    render :index
  end
end
