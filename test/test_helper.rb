ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
# Rails' own test_help only requires "minitest" (not "minitest/autorun"), so
# Object#stub (used to stub Rails.application.credentials in mailer/service
# tests) is not loaded automatically. Require it explicitly.
require "minitest/mock"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    include FactoryBot::Syntax::Methods
  end
end
