require 'minitest/ansi/version'
require 'delegate'
require 'ansi'

module MiniTest
  class Ansi < ::SimpleDelegator
    include AnsiVersion

    def initialize(stream=MiniTest::Unit.output)
      super
    end

    def print(*args)
      case args.first
      when '.'
        __getobj__.print(ANSI[:green] + '.' + ANSI[:clear])
      when 'F'
        __getobj__.print(ANSI[:yellow] + 'F' + ANSI[:clear])
      when 'E'
        __getobj__.print(ANSI[:red] + 'E' + ANSI[:clear])
      when 'S'
        __getobj__.print(ANSI[:cyan] + 'S' + ANSI[:clear])
      else
        __getobj__.print(*args)
      end
    end

    def use!
      MiniTest::Unit.output = self
    end
  end
end
