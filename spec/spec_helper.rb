require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'officedoc'

Rspec_Root = Pathname(__FILE__).dirname
def rspec_file(tail)
  Rspec_Root.join(tail)
end

Dir[rspec_file("support/**/*.rb")].each { |f| require f }
Dir[rspec_file("**/*_handlers.rb")].each { |f| require f }

RSpec.configure do |config|
  config.order = "random"
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true  
  
  config.include Support::FileHandlers  
end







