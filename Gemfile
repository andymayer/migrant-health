source 'https://rubygems.org'

ruby '2.4.2'

gem 'rails', '~> 5.1.4'

# Speed up booting
gem 'bootsnap', require: false
# Postgres
gem 'pg'
gem 'pg_search'

# Use SCSS for stylesheets and add bootstrap
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'

# Jquery and turbolinks and jquery-ui for topics
gem 'jquery-rails'
# gem 'jquery-ui-rails'
gem 'turbolinks'

# Multiple environment files
gem 'dotenv-rails'
# Useful for debug all over the place
gem 'awesome_print'

# For pretty urls
gem 'stringex'

# For topics
gem 'acts-as-taggable-on', '~> 5.0'

# Tidy logs
gem 'lograge'

# Authentication and authorisation
gem 'devise'
gem 'pundit'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

group :development, :test do

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'listen'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'better_errors'
  gem 'web-console'
  gem 'binding_of_caller'
  gem 'railroady'
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'annotate'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
end

