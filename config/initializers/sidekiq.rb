require_relative "redis"

Sidekiq.configure_server do |config|
  config.redis = {
    url: RedisConfig.url,
    namespace: RedisConfig.sidekiq.namespace
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: RedisConfig.url,
    namespace: RedisConfig.sidekiq.namespace
  }
end
