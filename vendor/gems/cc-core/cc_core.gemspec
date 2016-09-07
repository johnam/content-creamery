$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cc_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cc_core"
  s.version     = CCCore::VERSION
  s.authors     = ["John McCarthy"]
  s.email       = ["email@example.com"]
  s.summary     = "shared models"
  s.description = "shared models for cc and cc_admin"

  s.files = Dir["{app,config,db,lib,spec}/**/*", "Rakefile", "README.rdoc"]
  s.require_paths = ['lib', 'spec']
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 4.2.5'
  s.add_dependency 'rspec-rails', '~> 3.0'
  s.add_dependency 'factory_girl_rails', '~> 4.6.0'
  s.add_dependency 'carrierwave', '~> 0.11.2'
  s.add_dependency 'fog-aws', '~> 0.9.3'

  s.add_development_dependency "pg"
end
