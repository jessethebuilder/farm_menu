$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "farm_menu/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "menu"
  s.version     = FarmMenu::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jesse@anysoft.us"]
  s.homepage    = "http://anysoft.us"
  s.summary     = "Plugin for developing online menus, such as for restaurants or bars."
  s.description = "Rails backend and admin forms for menus for restaurants, bars, spas, mmj dispensaries, etc."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "open_close"
  s.add_dependency "farm_slugs"
  
  s.add_dependency "bootstrap-sass", "~> 3.0.3.0"
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'jquery-rails', '~> 4.1.1'
  s.add_dependency 'jquery-ui-rails', '~> 5.0.5'
  
  s.test_files = Dir["spec/**/*"]
end
