require "singleton"

class SimpleLogger
  include Singleton

  ERROR = 1
  WARNING = 2
  INFO = 3

  def initialize
    @level = WARNING
  end

  def error(msg)
    @log.puts(msg)
    @log.flush
  end

  def warning(msg)
    @log.puts(msg) if @level >= WARNING
    @log.flush
  end

  def info(msg)
    @log.puts(msg) if @level >= INFO
    @log.flush
  end
end

logger1 = SimpleLogger.instance
logger2 = SimpleLogger.instance

puts logger1, logger2
