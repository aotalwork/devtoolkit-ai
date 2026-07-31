module Ai
  class ErrorDebugger

    def self.call(error)

      prompt = <<~PROMPT
        Actúa como un experto Ruby on Rails.

        Analiza este error:

        #{error}

        Devuelve:

        1. Explicación sencilla
        2. Posibles causas
        3. Soluciones ordenadas
        4. Código corregido si aplica

        Sé concreto y evita explicaciones innecesarias.
      PROMPT

      Ai::Client.call(prompt)

    end

  end
end