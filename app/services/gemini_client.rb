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

    JSON.parse(response.body)

  end

end