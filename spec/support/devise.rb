require_relative './controller_macros'

RSpec.configure do |config|
  # config.include Devise::Test::ControllerHelpers, :request
  config.include Devise::TestHelpers, :request
  config.extend ControllerMacros, :type => :request
end