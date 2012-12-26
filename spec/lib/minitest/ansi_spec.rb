require 'spec_helper'
require 'minitest/ansi'
require 'stringio'

module MiniTest
  describe Ansi do
    before { @output = MiniTest::Unit.output }
    after { MiniTest::Unit.output = @output }

    it 'has a version number' do
      MiniTest::Ansi::VERSION.must_equal MiniTest::AnsiVersion::VERSION
    end

    it 'changes minitest output with use!' do
      subject = Ansi.new
      subject.object_id.wont_be_same_as MiniTest::Unit.output.object_id
      subject.use!
      subject.object_id.must_be_same_as MiniTest::Unit.output.object_id
    end

    describe 'printing chars' do
      subject { Ansi.new(StringIO.new) }

      def check_output(input, output)
        subject.instance_eval do
          print input
          rewind
          read.must_equal output
        end
      end

      it 'prints . in green' do
        check_output('.', "\e[32m.\e[0m")
      end

      it 'prints F in yellow' do
        check_output('F', "\e[33mF\e[0m")
      end

      it 'prints E in red' do
        check_output('E', "\e[31mE\e[0m")
      end

      it 'prints S in cyan' do
        check_output('S', "\e[36mS\e[0m")
      end
    end
  end
end
