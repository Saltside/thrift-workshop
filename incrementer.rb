$stdout.sync = true
$stderr.sync = true

require 'bundler/setup'
require 'thrift'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'gen-rb')

require 'counting_service'

transport = Thrift::FramedTransport.new(Thrift::Socket.new('server', 9090))
protocol = Thrift::BinaryProtocol.new(transport)
client = Workshop::CountingService::Client.new(protocol)

transport.open()

loop do
  client.increment

  sleep 1
end

transport.close()
