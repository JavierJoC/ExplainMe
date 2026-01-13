class UseCase
  def initialize(clipboard:, explainer:, tts:)
    @clipboard = clipboard
    @explainer = explainer
    @tts       = tts
  end

  def run
    text="#{@explainer}#{@clipboard}" #{clipboard}
      puts text
      system("paplay", @tts)

  end
end

