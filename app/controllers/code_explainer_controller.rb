class CodeExplainerController < ApplicationController
  def index
  end

  def create
    prompt = <<~PROMPT
      Eres un desarrollador senior.

      Explica el siguiente código:

      #{params[:input]}

      Incluye:

      - Resumen
      - Explicación línea a línea
      - Flujo de ejecución
      - Buenas prácticas
      - Posibles mejoras
    PROMPT

    result = GeminiClient.generate(prompt)

    @response = result.dig("candidates", 0, "content", "parts", 0, "text")

    render :index
  end
end