require "ruby/openai"

class ExplainerOpenAI
  def initialize
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end

  def explain(text)
    prompt = "Explain this simply:\n\n#{text}"

    response = @client.chat(
      parameters: {
        model: "gpt-4o",
        messages: [{ role: "user", content: prompt }],
        temperature: 0.4
      }
    )

    response.dig("choices", 0, "message", "content").strip
  end
end
