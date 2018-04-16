source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# gem 'ruby', '~> 2.4.1'
gem 'rails', '~> 5.1.5'
gem "omniauth-google-oauth2", "~> 0.2.1"
gem 'aws-sdk-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'zip-codes'
gem 'bootstrap-slider-rails'

gem 'figaro'
gem 'faraday'
# gem 'sass-rails', '~> 5.0'
gem "jquery-slick-rails"
gem 'carrierwave-aws'
gem 'bootstrap-modal-rails'

gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'mailboxer'
gem 'will_paginate', '~> 3.1.0'
gem "active_model_serializers"
gem 'redis'
gem 'sidekiq'
gem 'mailgun-ruby'


# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# To compile master branch for heroku due to ES6
gem 'sass-rails', github: 'rails/sass-rails', branch: 'master'
gem 'sprockets-rails', github: 'rails/sprockets-rails', branch: 'master'
gem 'sprockets', github: 'rails/sprockets', branch: 'master'
gem 'babel-transpiler'
gem 'jquery-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'pry'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'launchy'
  gem "letter_opener"
  gem 'database_cleaner'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  # gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
