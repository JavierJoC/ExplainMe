require 'colorize'
#This is the code for puts text in the terminal
def wrap_text(text, width = 70)
  text.scan(/\S.{0,#{width-2}}\S(?=\s|$)|\S+/).join("\n")
end
def wrap_text_indent(text, width = 70, indent = 4)
  prefix = ' ' * indent
  wrap_text(text, width).lines.map { |line| prefix + line }.join
end


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
      

      puts "\n\n"
      puts wrap_text_indent(text,80,4).center(80).yellow.bold
      @tts.speak(text)
      puts "\n\n"
      explanation = @explainer.explain(text)
      
      puts wrap_text_indent(explanation,80,4).cyan
      @tts.speak(explanation)


     # system("paplay", @tts)

      sleep 3


      puts "\n\n"
      puts wrap_text_indent(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::", 80,4).center(80).gray
      puts "\n\n\n"

    end

  end
end

