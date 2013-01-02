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

    def puts(*args)
      if args.any?
        args.first.gsub!(/\d+\) Failure/, ANSI[:yellow] + "\\0" + ANSI[:clear])
        args.first.gsub!(/\d+\) Error/, ANSI[:red] + "\\0" + ANSI[:clear])
        args.first.gsub!(/\d+\) Skipped/, ANSI[:cyan] + "\\0" + ANSI[:clear])
        args.first.gsub!(/[1-9]\d* failures/, ANSI[:yellow] + "\\0" + ANSI[:clear])
        args.first.gsub!(/[1-9]\d* errors/, ANSI[:red] + "\\0" + ANSI[:clear])
        args.first.gsub!(/[1-9]\d* skips/, ANSI[:cyan] + "\\0" + ANSI[:clear])
      end
      __getobj__.puts(*args)
    end

    def self.use!
      MiniTest::Unit.output = new
    end
  end
end
