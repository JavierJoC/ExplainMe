

module Explainme
  def self.run
    clipboard="straigfordward"
    explainer="The meaning of #{clipboard}"

    ruta_padre = File.join(__dir__, "..", "input_prompt.wav")
    ruta_completa = File.expand_path(ruta_padre)
    puts "Ruta relativa: #{ruta_padre}"
    puts "Ruta absoluta: #{ruta_completa}"
    tts=ruta_completa
    puts tts


    puts explainer

    system("paplay", tts)

  end
end

