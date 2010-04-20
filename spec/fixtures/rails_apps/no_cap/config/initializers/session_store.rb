# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_no_cap_session',
  :secret      => '6725befefd9f03f65c96e4fce3e737dea28a26d47d4f50d3576ed099e2ba54a5b35e06460368ccdec6147760e73aa9f7ab23f7efcb790ad2d372d235264f2d00'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
