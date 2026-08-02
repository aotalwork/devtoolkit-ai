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

    render :index
  end
end