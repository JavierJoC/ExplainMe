require_relative "use_case"
require_relative "clipboard_x11"
require_relative "explainer_openai"
require_relative "tts_piper"

module Explainme
  def self.run
    clipboard   = ClipboardX11.new
    explainer   = ExplainerOpenAI.new

    tts         = TTSPiper.new

    UseCase.new(
      clipboard:clipboard,
      explainer:explainer,
      tts:tts
    ).run

  end
end

