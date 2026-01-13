class UseCase
  def initialize(clipboard:, explainer:, tts:)
    @clipboard = clipboard
    @explainer = explainer
    @tts       = tts
  end

  def run

    loop do
      text="#{@explainer}#{@clipboard.read}" #{clipboard}
      puts text
      system("paplay", @tts)

      sleep 3
    end

  end
end

