# Setup

- Run `bundle`

- Generate Google APIcredentials following: https://cloud.google.com/text-to-speech/docs/reference/libraries#client-libraries-usage-ruby

- Save inside this directory as credentials.json

- Run `export GOOGLE_APPLICATION_CREDENTIALS="./credentials.json"`


# Usage

- Add text inside `text.txt`

- Run `ruby ./main.rb`

- Mp3s will be placed inside the `output` directory


# Resources

- Google SSML supported markup: https://cloud.google.com/text-to-speech/docs/ssml

- Available voices: https://cloud.google.com/text-to-speech/docs/voices
