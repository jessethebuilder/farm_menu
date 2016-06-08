source 'https://rubygems.org'

# Declare your gem's dependencies in menu.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'open_close', :git => 'https://github.com/jessethebuilder/open_close'
gem 'farm_slugs', :git => 'https://github.com/jessethebuilder/farm_slugs'

group :test, :development do
  # gem 'cliver', :git => 'git://github.com/yaauie/cliver', :ref => '5617ce'
  gem 'faker'
  gem 'rspec-rails'
  # gem 'wdm'
  gem 'database_cleaner', '~> 1.0.0rc'
  gem 'timecop'
  gem 'sqlite3'
  # gem 'byebug'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
  # gem 'selenium-webdriver'
  gem 'shoulda'
  # gem 'launchy', '~> 2.3.0'
  # gem 'poltergeist'
end