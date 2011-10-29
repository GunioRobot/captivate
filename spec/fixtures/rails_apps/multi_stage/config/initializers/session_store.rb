# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_multi_stage_session',
  :secret      => '5248e6f0fed9ff411dc9fb442bb8bf33b74148a47dd92c19ef645810f4ccd09649b4ce3ca63a7af4455c8028a2cb25a676f880a86d1089255774aea09731abff'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
