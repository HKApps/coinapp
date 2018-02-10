source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.1'
gem 'rails_12factor'

# Assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '>= 3.0.0.0'
gem 'haml-rails'
gem 'angularjs-rails'

# Config Management
gem 'figaro'

# Process Management
gem 'foreman'

# Database
gem 'pg'

# Webserver
gem 'unicorn'

# Authentication
gem 'authlogic'

# Jobs and Scheduler
gem 'clockwork'
gem 'sidekiq'
gem 'sinatra'

# External API libs
gem 'coinbase'
gem 'twilio-ruby'

# Monitoring
gem 'newrelic_rpm'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'pry'
  gem 'pry-nav'
end
group :development, :test do
  gem 'factory_girl_rails'
end
group :test do
  gem 'minitest-spec-rails'
  gem 'minitest-wscolor'
end
