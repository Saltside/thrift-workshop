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

  def increment(value)
    if value <= 0
      fail Workshop::IncrementException.new({ value: value })
    else
      @lock.synchronize do
        @counter = @counter + value
      end
    end
  end
end

server = ThriftServer.threaded Workshop::CountingService, Handler.new

server.log Logger.new($stdout)

server.start
