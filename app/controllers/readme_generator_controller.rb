class ReadmeGeneratorController < ApplicationController
  def index
  end

  def create
    prompt = <<~PROMPT
      Eres un experto en documentación técnica.

      Genera un README profesional para:

      #{params[:input]}

      Incluye:

      - Descripción
      - Instalación
      - Tecnologías
      - Uso
      - Variables de entorno
      - Contribución
      - Licencia

      Devuelve únicamente Markdown.
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
