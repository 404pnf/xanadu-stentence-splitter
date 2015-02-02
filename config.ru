# environment
# Current environment. Defaults to ENV['RACK_ENV'], or "development" if not available.
# config.ru (run with rackup)

# RACK_ENV=production ruby my_app.rb
require './app'
run Sinatra::Application
