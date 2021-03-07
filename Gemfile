source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1.3"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"
# gem "mysql2", "~> 0.5.3"

# Use Puma as the app server
gem "puma", "~> 5.0"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "active_model_serializers", "~> 0.10.12"
# gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.2.5"
# gem 'redis', '~> 4.0'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

# Authentication
gem "devise_token_auth", "~> 1.1.5"

# Authorization
gem "pundit", "~> 2.1.0"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"

# Chatomud
gem "aasm", "~> 5.1.1"
gem "colorize", "~> 0.8.1"
gem "facets", "~> 3.1.0", require: false
gem "net-telnet", "~> 0.2.0"
gem "parslet", "~> 2.0.0"
gem "require_all", "~> 3.0.0"
gem "ruby-sun-times", "~> 0.1.5"
gem "stopwords-filter", "~> 0.4.1", require: "stopwords"

group :development do
  gem "listen", "~> 3.3"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem "rspec-rails", "~> 4.0.2"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
