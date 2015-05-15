require 'byebug'
Dir["./lib/*.rb"].each {|file| require file }

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end