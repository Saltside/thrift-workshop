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
  begin
    client.increment (rand * 10).to_i
    puts 'incremented...'
  rescue Workshop::IncrementException
    puts 'meh, bad random value'
  end

  sleep rand
end
