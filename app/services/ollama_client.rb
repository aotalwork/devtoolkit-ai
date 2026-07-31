require "net/http"
require "json"

class OllamaClient
  URL = URI("http://localhost:11434/api/generate")

  def self.generate(prompt)
    response = Net::HTTP.post(
      URL,
      {
        model: "llama3.2:3b",
        prompt: prompt,
        stream: false
      }.to_json,
      "Content-Type" => "application/json"
    )

    JSON.parse(response.body)["response"]
  end
end