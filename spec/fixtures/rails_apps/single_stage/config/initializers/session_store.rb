# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_single_stage_session',
  :secret      => '6aba502d239584af422c49eb2ddfca6df67df8bab51143d137ab37c5fd41e7bef77e527bf5a25568450371c2151f44d8cd90a8078502f6cd27de1f068446acec'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
