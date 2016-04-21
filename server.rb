$stdout.sync = true
$stderr.sync = true

require 'bundler/setup'
require 'thrift_server'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'gen-rb')

require 'counting_service'
require 'thread'

class Handler
  def initialize
    @counter = 0
    @lock = Mutex.new
  end

  def getValue
    @lock.synchronize do
      @counter
    end
  end

  def increment
    @lock.synchronize do
      @counter = @counter + 1
    end
  end
end

server = ThriftServer.threaded Workshop::CountingService, Handler.new

server.log Logger.new($stdout)

server.start
