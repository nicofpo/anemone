class OAuthConfig < Settingslogic
  source Rails.root.join('config', 'omniauth.yml')
  namespace Rails.env
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, OAuthConfig.twitter.consumer_key, OAuthConfig.twitter.consumer_secret
end
