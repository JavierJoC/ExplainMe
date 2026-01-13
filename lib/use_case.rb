class UseCase
  def initialize(clipboard:, explainer:, tts:)
    @clipboard = clipboard
    @explainer = explainer
    @tts       = tts
  end

  def run
  last = nil

    loop do
      text=@clipboard.read
      next if text.nil? || text == last
      last = text


      puts text
      system("paplay", @tts)

      sleep 3
    end

  end
end

