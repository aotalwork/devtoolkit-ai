class OllamaClient

  URL = "http://localhost:11434/api/generate"

  def self.generate(prompt)

    uri = URI(URL)

    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = 10
    http.read_timeout = 120

    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"

    request.body = {
      model: "llama3.2:3b",
      prompt: prompt,
      stream: false
    }.to_json

    puts "🚀 Enviando a Ollama"

    response = http.request(request)

    puts "✅ Respuesta recibida"

    JSON.parse(response.body)

  end

end