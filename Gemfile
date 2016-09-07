source 'https://rubygems.org'

ruby '2.3.1'

gem 'fog-aws', '~> 0.9.3'
gem 'carrierwave', '~> 0.11.2'
gem 'coffee-rails', '~> 4.1.0'
gem 'dalli', '~> 2.7.6'
gem 'delayed_job_active_record', '~> 4.1.0'
gem 'devise', '3.5.6' #locked down b/c registrations controller is modified
gem 'friendly_id', '~> 5.1.0'
gem 'gibbon', '~> 2.2.3'

gem 'cc_core', path: 'vendor/gems/cc-core'

gem 'paper_trail', '~> 4.0.1'
gem 'pg', '~> 0.18.4'
gem 'puma', '~> 3.4.0'
gem 'rails', '4.2.6'
gem 'sass-rails', '~> 5.0'
gem 'slim', '~> 3.0.6'
gem 'slim-rails', '~> 3.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'kaminari', '~> 0.16.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

group :development, :test do
  # gem 'byebug' Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'capybara', '~> 2.7.0'
  gem 'dotenv', '~> 2.1.1'
  gem 'factory_girl_rails', '~> 4.6.0'
  gem 'ffaker', '~> 2.2.0'
  gem 'database_cleaner', '~> 1.5.3'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'rspec-collection_matchers', '~> 1.1.2'
  gem 'selenium-webdriver', '~> 2.53.3'
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'turnip', '~> 2.1.0'
  gem 'vcr', '~> 3.0.1'
  # gem 'webmock', '~> 2.0.1'
end

group :development do
  # gem 'spring'
  gem 'vendorise', '~> 0.3.0'
  gem 'web-console', '~> 2.0' # Access an IRB console on exception pages or by using <%= console %> in views
end

group :production do
  gem 'rack-timeout', '~> 0.4.2'
  gem 'rails_12factor', '~> 0.0.3'
end
