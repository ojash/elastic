# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Elastic::Application.config.secret_key_base = 'e469580c27ac1052afdfe480089966a9dd1d6f7cfbe6614e62da4bd4b26ed3176d48f102321886f1c2a3499bafbc272b887699dfecbd364491b8b33589c3fd4c'
