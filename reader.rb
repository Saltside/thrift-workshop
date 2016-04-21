$stdout.sync = true
$stderr.sync = true

require 'bundler'
require 'thrift'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'gen-rb')

require 'counting_service'

transport = Thrift::BufferedTransport.new(Thrift::Socket.new('server', 9090))
protocol = Thrift::BinaryProtocol.new(transport)
client = Workshop::CountingService::Client.new(protocol)

transport.open()

puts client.getValue

transport.close()
