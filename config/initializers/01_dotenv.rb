if Rails.env.development? || Rails.env.test?
  require 'dotenv'
  Dotenv.load('.env', '.env.test')
end