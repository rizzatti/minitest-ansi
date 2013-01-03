# encoding: UTF-8

require 'minitest/ansi/version'
require 'delegate'
require 'ansi'

module MiniTest
  class ANSI < ::SimpleDelegator
    include ANSIVersion

    TEST_REGEX = /\d+(\)| tests)/
    MAPPING = [
      [/[1-9]\d*\)? (F|f)ailures?/, :yellow],
      [/[1-9]\d*\)? (E|e)rrors?/, :red],
      [/[1-9]\d*\)? (S|s)kip(ped|s)/, :cyan],
    ]

    def initialize(stream=MiniTest::Unit.output)
      super
    end

    def print(*args)
      char = args.first
      color = case char
      when '.'; then :green
      when 'F'; then :yellow
      when 'E'; then :red
      when 'S'; then :cyan
      else
        __getobj__.print(*args)
        return
      end
      __getobj__.print(::ANSI[color] + char + ::ANSI[:clear])
    end

    def puts(*args)
      str = args.first
      if str && (str =~ TEST_REGEX) != nil
        MAPPING.each do |regex, color|
          str.gsub!(regex, ::ANSI[color] + "\\0" + ::ANSI[:clear])
        end
      end
      __getobj__.puts(*args)
    end

    def self.use!
      MiniTest::Unit.output = new
    end
  end
end
