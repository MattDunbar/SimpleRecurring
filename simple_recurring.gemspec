$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_recurring/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_recurring"
  s.version     = SimpleRecurring::VERSION
  s.authors     = ["Matt Dunbar"]
  s.email       = ["matt@buildrx.com"]
  s.summary     = "A single way to interact with any supported credit card based recurring payments provider."

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.9"

  s.add_development_dependency "sqlite3"
end
