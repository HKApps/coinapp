Coinapp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: ENV["DOMAIN_NAME"],
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV["GMAIL_USERNAME"],
    password: ENV["GMAIL_PASSWORD"]
  }
  # Send email in development mode.
  config.action_mailer.perform_deliveries = true

  # Coinbase
  config.coinbase_api_key    = ENV['COINBASE_API_KEY'] || '06df06a77ffa379be9dbe63edca7a70d46dcd73cddf2cdda2d9a06c8778d2a6d'
  config.coinbase_api_secret = ENV['COINBASE_API_SECRET'] || 'f0012b96f172af7c42da890efcfa8b98d8dc32dbe31b9cac9b4c76f5f551864a'

  # Twilio
  config.twilio_sid        = ENV['TWILIO_ACCOUNT_SID'] || 'ACdbacbf5f4d0c5341f6ef363a4509f05a'
  config.twilio_auth_token = ENV['TWILIO_AUTH_TOKEN'] || '7512f2ef0284748fbbb6f61261777cad'
  config.twilio_number     = ENV['TWILIO_NUMBER'] || '+19163419340'
end
