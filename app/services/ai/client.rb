require "json"

module Ai
  class Client
    def self.call(prompt)
      response = Faraday.post(
        "http://localhost:11434/api/generate"
      ) do |req|
        req.headers["Content-Type"] = "application/json"

        req.body = {
          model: "llama3.1:8b",
          prompt: prompt,
          stream: false
        }.to_json
      end

      body = JSON.parse(response.body)

      body["response"]
    end
  end
end