require 'spec_helper'
require 'minitest/ansi'
require 'stringio'

module MiniTest
  describe Ansi do
    before { @output = MiniTest::Unit.output }
    after { MiniTest::Unit.output = @output }

    describe "class" do
      subject { Ansi }

      it 'has a version number' do
        subject::VERSION.must_equal AnsiVersion::VERSION
      end

      it 'changes minitest output with use!' do
        output = subject.use!
        output.object_id.must_be_same_as MiniTest::Unit.output.object_id
        output.must_respond_to :print
        output.must_respond_to :puts
      end
    end

    describe 'printing chars' do
      subject { Ansi.new(StringIO.new) }

      def check_output(input, output)
        subject.print input
        subject.rewind
        subject.read.must_equal output
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

    describe 'printing the status' do
      subject { Ansi.new(StringIO.new) }

      def check_output(input, output)
        subject.puts input
        subject.rewind
        subject.read.must_match output
      end

      it 'prints failures in yellow' do
        check_output('1 failures', "\e[33m1 failures\e[0m")
      end

      it 'print error in red' do
        check_output('3 errors', "\e[31m3 errors\e[0m")
      end

      it 'prints skips in cyan' do
        check_output('2 skips', "\e[36m2 skips\e[0m")
      end

      it 'does not colorize when there are no problems' do
        input = '0 failures, 0 errors, 0 skips'
        subject.puts input
        subject.rewind
        output = subject.read
        output.wont_match "\e[33m"
        output.wont_match "\e[36m"
        output.wont_match "\e[31m"
      end
    end
  end
end
