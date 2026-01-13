require "ruby/openai"

class ExplainerOpenAI
  def initialize
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end

  def explain(text)
    prompt = "Explain the ideas or meanings, from this text(that contain a phrase, a sentence or maybe a simple word) as if you were speaking to a friend who is learning English. Use very simple, everyday language and a natural, conversational flow. The focus is on conveying the core meaning in a way that is easy to grasp intuitively, without complex analysis. Write it as a single, fluid piece of text  as Dr. Krashen suggests, please don't use sentences whit just two or one words (like: hey, so) isolated ideas because my tex to spech app doesn't works good,  and analyze the relationship between its literal meaning and its underlying message, and if you get the same text that ytou process before, create a new explanation about the phase between follows angle brakets:\n\n<#{text}>"

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
