require_relative "use_case"
require_relative "clipboard_x11"

module Explainme
  def self.run
    clipboard   = ClipboardX11.new
    explainer   = "The meaning of "

    ruta_padre = File.join(__dir__, "..", "input_prompt.wav")
    ruta_completa = File.expand_path(ruta_padre)
    #puts "Ruta absoluta: #{ruta_completa}"
    tts         = ruta_completa
    #puts tts

    UseCase.new(
      clipboard:clipboard,
      explainer:explainer,
      tts:tts
    ).run

  end
end

