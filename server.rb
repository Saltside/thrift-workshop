$stdout.sync = true
$stderr.sync = true

require 'bundler/setup'
require 'thrift_server'

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

server = ThriftServer.threaded Workshop::CountingService, Handler.new

server.log Logger.new($stdout)

server.start
