class UserSession < Authlogic::Session::Base
  oauth2_client_id      ENV['COINBASE_CLIENT_ID']
  oauth2_client_secret  ENV['COINBASE_CLIENT_SECRET']
  oauth2_site           "https://coinbase.com"
end
