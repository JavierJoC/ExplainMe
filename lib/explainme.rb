
module Explainme
  def self.run
    clipboard="straigfordward"
    explainer="The meaning of #{clipboard}"
    tts="/home/bocho/AdD/Mec/Xprn/Ars/Techne/ExplainMe/input_prompt.wav"

    puts explainer
    system("aplay", tts)

  end
end

