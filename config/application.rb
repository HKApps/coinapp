require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Coinapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Coinbase
    config.coinbase_api_key    = ENV['COINBASE_API_KEY'] || '06df06a77ffa379be9dbe63edca7a70d46dcd73cddf2cdda2d9a06c8778d2a6d'
    config.coinbase_api_secret = ENV['COINBASE_API_SECRET'] || 'f0012b96f172af7c42da890efcfa8b98d8dc32dbe31b9cac9b4c76f5f551864a'
  end
end
