source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.2'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma', '~> 4.3'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'image_processing', '~> 1.2'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'omniauth-google-oauth2', '~> 0.8.0'
gem 'omniauth-rails_csrf_protection', '~> 0.1'
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'paranoia', '~> 2.4', '>= 2.4.2'
gem 'aasm', '~> 5.0', '>= 5.0.6'
gem "braintree", "~> 2.100.0"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'foreman', '~> 0.86.0'
  # gem 'sqlite3', '~> 1.4'

  gem 'rspec-rails', '~> 3.9'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'faker', '~> 2.8', '>= 2.8.1'
  gem 'hirb-unicode', '~> 0.0.5'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

