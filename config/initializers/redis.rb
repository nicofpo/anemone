class RedisConfig < Settingslogic
  source Rails.root.join('config', 'redis.yml')
  namespace Rails.env
end
