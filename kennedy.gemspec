$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kennedy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kennedy"
  s.version     = Kennedy::VERSION
  s.authors     = ["Mathieu Gagné"]
  s.email       = ["mathieu@motioneleven.com"]
  s.homepage    = "http://www.motioneleven.com"
  s.summary     = "Bloging Engine - addon to Georgia"
  s.description = "Adds a blogging engine to Motion Eleven's Georgia CMS system."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "draper"
  s.add_dependency "georgia", '0.4'
  s.add_dependency "henry", '0.4'

  s.add_development_dependency 'thin'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'debugger'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara', "~>2.0.3"
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'rb-inotify'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'brakeman'
  s.add_development_dependency 'rails_best_practices'
  s.add_development_dependency 'bullet'
end
