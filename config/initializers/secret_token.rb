# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')

  if File.exists?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end

end

# SampleApp::Application.config.secret_key_base = 'f7835da350d7f9f23ecd230a1e15cb7a06dd6f4f94c40179ff067cca81e5e6cd702c2d4e24bc8445c9069bfe9a42ccab9349a94fc2a46dc5537bf24134b06214'
SampleApp::Application.config.secret_key_base = secure_token
