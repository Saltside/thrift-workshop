$stdout.sync = true
$stderr.sync = true

require 'bundler/setup'
require 'thrift_server'

$LOAD_PATH << File.join(File.dirname(__FILE__), 'gen-rb')

require 'time_stamp_service'
require 'thread'

class Handler
  def initialize
    @lock = Mutex.new
  end

  def getCurrentTimeStamp
    @lock.synchronize do
      Time.now.to_i
    end
  end
end

server = ThriftServer.threaded Workshop::TimeStampService, Handler.new

server.log Logger.new($stdout)

server.start
