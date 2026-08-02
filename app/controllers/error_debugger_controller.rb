class ErrorDebuggerController < ApplicationController
  def index
  end

  def create
    prompt = <<~PROMPT
      Actúa como un desarrollador senior de Ruby on Rails.

      Explica el siguiente error en idioma español:

      #{params[:error]}

      Devuelve:

      - Explicación sencilla
      - Posibles causas
      - Soluciones ordenadas
      - Ejemplo de código corregido
    PROMPT

    result = GeminiClient.generate(prompt)

    @response = result.dig(
      "candidates",
      0,
      "content",
      "parts",
      0,
      "text"
    )

    render :index
  end
end
