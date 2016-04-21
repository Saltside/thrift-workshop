$stdout.sync = true
$stderr.sync = true

require 'bundler'
require 'thrift'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'gen-rb')

require 'counting_service'

class Handler
  def initialize
    @counter = 0
  end

  def getValue
    @counter
  end

  def increment
    @counter = @counter + 1
  end
end

handler = Handler.new()
processor = Workshop::CountingService::Processor.new(handler)
transport = Thrift::ServerSocket.new(9090)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::ThreadedServer.new(processor, transport, transportFactory)

puts "Starting the server..."
server.serve()
puts "done."
