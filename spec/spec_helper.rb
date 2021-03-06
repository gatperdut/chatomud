require File.expand_path("../config/environment", __dir__)

require "rspec/rails"
require "parslet/rig/rspec"

RSpec.configure do |config|
  config.file_fixture_path = "spec/fixtures"
end

Rails.env = "test"
