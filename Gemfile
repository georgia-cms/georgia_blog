source 'https://rubygems.org'
gemspec

group :development, :test do
  gem 'rails'
  gem 'pry-byebug'
  gem 'georgia', path: '~/workspace/georgia'
end

group :development do
  gem 'thin'
  gem 'letter_opener'
end

group :test do
  gem 'sqlite3'
  gem 'rspec-rails', '< 3'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'coveralls', require: false
end