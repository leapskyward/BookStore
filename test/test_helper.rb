ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'sidekiq/testing'
# require 'simplecov'

SimpleCov.start

class ActionDispatch::IntegrationTest
  include UsersHelper

  def log_user(email, password)
    # User.anonymous
    get login_path
    post login_path, params: {
      session: {
        email: email,
        password: password,
      } 
    }
  end

end

class ActiveSupport::TestCase
  fixtures :all
end
