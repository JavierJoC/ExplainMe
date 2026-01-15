class TTSPiper

  def speak(text) #, model)
    safe = text.gsub("'", "’")

#    system(%Q{
#      echo '#{safe}' |
#       piper --model /opt/piper/models/en_US-lessac-high.onnx --output-raw |
#      aplay -r 22050 -f S16_LE -t raw
#    })
    #


system(%Q{ bash -c ' \
                      echo #{safe} \
                    | piper --model /opt/piper/models/en_US-ryan-high.onnx --output-raw  2>/dev/null \
                    | tee >(paplay --rate=22050 --format=s16ne --channels=1 --raw >/dev/null 2>&1) \
                    | sox -r 22050 -e signed -b 16 -c 1 -t raw - speach2.wav >/dev/null 2>&1  \
        '})

  end
end

