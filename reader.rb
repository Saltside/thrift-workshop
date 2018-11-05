$stdout.sync = true
$stderr.sync = true

require 'bundler/setup'
require 'thrifter'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'gen-rb')

require 'time_stamp_service'

ServiceClient = Thrifter.build(Workshop::TimeStampService::Client)

ServiceClient.configure do |config|
  config.uri = 'tcp://server:9090'
  config.keep_alive = true
end

client = ServiceClient.new

loop do
  puts client.getCurrentTimeStamp

  sleep rand
end
