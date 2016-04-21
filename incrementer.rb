$stdout.sync = true
$stderr.sync = true

require 'bundler/setup'
require 'thrifter'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'gen-rb')

require 'counting_service'

ServiceClient = Thrifter.build(Workshop::CountingService::Client)

ServiceClient.configure do |config|
  config.uri = 'tcp://server:9090'
  config.keep_alive = true
end

client = ServiceClient.new

loop do
  client.increment

  sleep 1
end
