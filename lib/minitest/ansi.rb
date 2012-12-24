require 'minitest/ansi/version'
require 'delegate'

module MiniTest
  class Ansi < ::SimpleDelegator
    include AnsiVersion

    def initialize(stream=MiniTest::Unit.output)
      super
    end

    def use!
      MiniTest::Unit.output = self
    end
  end
end
