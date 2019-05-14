# Synthesizes speech from the input string of text or ssml.
# Note: ssml must be well-formed according to:
# https://www.w3.org/TR/speech-synthesis/
require "dotenv/load"
require "google/cloud/text_to_speech"

# text = "Ciao ciccio, come funziona questo coso?"
text = File.read('text.txt')

# Instantiates a client
client = Google::Cloud::TextToSpeech.new

# Set the text input to be synthesized
# synthesis_input = { text: text }
synthesis_input = { ssml: text }

# Build the voice request, select the language code ("en-US") and the ssml
# voice gender ("neutral")
voice = {
  language_code: "it-IT",
  name: "it-IT-Wavenet-A"
}

# Select the type of audio file you want returned
audio_config = { 
  audio_encoding: "MP3",
  pitch: 0,
  speaking_rate: 0.9
}

# Perform the text-to-speech request on the text input with the selected
# voice parameters and audio file type
response = client.synthesize_speech synthesis_input, voice, audio_config

filename = "output/output-#{Time.now.to_i}.mp3"

# The response's audio_content is binary.
File.open filename, "wb" do |file|
  # Write the response to the output file.
  file.write response.audio_content
end

puts "Audio content written to file '#{filename}'"
