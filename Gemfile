source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'

gem 'font-awesome-rails'
gem 'hiredis'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'peek'
gem 'peek-git'
gem 'peek-host'
gem 'peek-mysql2'
gem 'peek-performance_bar'
gem 'peek-sidekiq'
gem 'puma', '~> 3.0'
gem 'redis'
gem 'sass-rails', '~> 5.0'
gem 'settingslogic'
gem 'sidekiq'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'ffaker'
end
