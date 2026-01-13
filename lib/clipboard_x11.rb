class ClipboardX11
  def read
    text = `xclip -o -selection primary 2>/dev/null`.strip
    text.empty? ? nil : text
  end
end

