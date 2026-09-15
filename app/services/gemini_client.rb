
class GeminiClient
  MODEL = "gemini-flash-latest"

  URL = "https://generativelanguage.googleapis.com/v1beta/models/#{MODEL}:generateContent"

  def self.generate(prompt)
    uri = URI("#{URL}?key=#{ENV['GEMINI_API_KEY']}")

    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"

    request.body = {
      contents: [
        {
          parts: [
            {
              text: prompt
            }
          ]
        }
      ]
    }.to_json

    response = Net::HTTP.start(
      uri.hostname,
      uri.port,
      use_ssl: true
    ) do |http|
      http.request(request)
    end

    body = JSON.parse(response.body)

    unless response.is_a?(Net::HTTPSuccess)
      raise GeminiError.new(response.code.to_i, body)
    end

    body
  end

  class GeminiError < StandardError
    attr_reader :status, :body

    def initialize(status, body)
      @status = status
      @body = body
      super(body.dig("error", "message") || "Error desconocido de Gemini")
    end
  end
end

