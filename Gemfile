source 'https://rubygems.org'
ruby '2.3.3'

# BASE
gem 'rails', '4.2.8'
gem 'unicorn'
gem 'responders', '~> 2.0'
gem 'kaminari'

# STORAGE
gem 'pg'

# FRONT-END
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem "ember-cli-rails"

# DOCUMENTATION
gem 'sdoc', '~> 0.4.0', group: :doc

# SERIALIZERS
gem 'active_model_serializers', '~> 0.10.3'
gem 'oj'

# UI
gem "twitter-bootstrap-rails"

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'capybara'
  gem 'capybara-mechanize'
end

group :production do
  gem 'rails_12factor'
  gem 'heroku_rails_deflate'
  gem 'rack-timeout'
  gem 'uglifier', '>= 1.3.0'
end
