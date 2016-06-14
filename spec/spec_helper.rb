ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
# require 'rspec/autorun'
require 'factory_girl_rails'
Rails.backtrace_cleaner.remove_silencers!
# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
require 'capybara/rspec'
require 'capybara/poltergeist'
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {debug: true})
end
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.mock_with :rspec
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  
  config.include FactoryGirl::Syntax::Methods
  config.include ActionView::Helpers::NumberHelper

  #-------------------- DB Cleaner ---------------------  
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end
  
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    # DatabaseCleaner.start
  end
  
  config.before(:each, :type => :feature) do
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test
    
    if !driver_shares_db_connection_with_specs
      DatabaseCleaner.strategy = :truncation
    end
  end
  
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
  
   # config.before :suite do
    # DatabaseCleaner.strategy = :truncation
  # end
# 
  # config.before(:each) do
    # DatabaseCleaner.strategy = :transaction
  # end
# 
  # config.before(:each, :js => true) do
    # DatabaseCleaner.strategy = :truncation
  # end

  #---------------------- End DB Cleaner -----------

  
  # -------------- Delete Images ---------------
  # config.after(:each) do
    # if Rails.env.test? || Rails.env.cucumber?
      # FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
    # end 
  # end

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.include RequestSpecsHelper

end