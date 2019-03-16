# frozen_string_literal: true

require "simplecov"

SimpleCov.minimum_coverage 99
SimpleCov.start

ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../config/environment", __dir__)

abort("The Rails environment is in production mode!") if Rails.env.production?

require "spec_helper"
require "rspec/rails"
require "support/factory_girl"
require "capybara/rails"
require "capybara/rspec"
require "site_prism"
require "capybara/poltergeist"

Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

Dir[Rails.root.join("spec", "support", "**", "*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  %i[controller view request].each do |type|
    config.include Devise::Test::IntegrationHelpers, type: :feature
    config.include ::Rails::Controller::Testing::TestProcess, type: type
    config.include ::Rails::Controller::Testing::TemplateAssertions, type: type
    config.include ::Rails::Controller::Testing::Integration, type: type
  end

  config.include Devise::Test::ControllerHelpers, type: :controller
end
