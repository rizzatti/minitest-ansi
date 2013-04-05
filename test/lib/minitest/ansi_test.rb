require 'test_helper'
require 'minitest/ansi'
require 'stringio'

module MiniTest
  describe ANSI do
    before { @output = MiniTest::Unit.output }
    after { MiniTest::Unit.output = @output }

    subject { ANSI }

    it 'has a version number' do
      subject::VERSION.must_equal ANSIVersion::VERSION
    end

    it 'changes minitest output with use!' do
      output = subject.use!
      output.object_id.must_be_same_as MiniTest::Unit.output.object_id
      output.must_respond_to :print
      output.must_respond_to :puts
    end

    describe 'IO' do
      subject { ANSI.new(StringIO.new) }

      def assert_io(method, input, output)
        subject.send method, input
        subject.rewind
        subject.read.must_equal output
      end

      def assert_print(input, output)
        assert_io(:print, input, output)
      end

      def assert_puts(input, output)
        assert_io(:puts, input, output + "\n")
      end

      describe 'printing chars' do
        it 'prints . in green' do
          assert_print '.', "\e[32m.\e[0m"
        end

        it 'prints F in yellow' do
          assert_print 'F', "\e[33mF\e[0m"
        end

        it 'prints E in red' do
          assert_print 'E', "\e[31mE\e[0m"
        end

        it 'prints S in cyan' do
          assert_print 'S', "\e[36mS\e[0m"
        end

        it 'prints everything else without colors' do
          assert_print 'x', 'x'
        end
      end

      describe 'describing each problem' do
        it 'prints failures in yellow' do
          assert_puts '1) Failure', "\e[33m1) Failure\e[0m"
        end

        it 'prints errors in red' do
          assert_puts '  2) Error', "  \e[31m2) Error\e[0m"
        end

        it 'prints skippeds in cyan' do
          assert_puts '60) Skipped', "\e[36m60) Skipped\e[0m"
        end
      end

      describe 'showing the status line' do
        it 'prints failures in yellow' do
          assert_puts '3 tests, 1 failures', "3 tests, \e[33m1 failures\e[0m"
        end

        it 'print error in red' do
          assert_puts '10 tests, 3 errors', "10 tests, \e[31m3 errors\e[0m"
        end

        it 'prints skips in cyan' do
          assert_puts '5 tests, 2 skips', "5 tests, \e[36m2 skips\e[0m"
        end

        it 'does not colorize when there are no problems' do
          input = '99 tests, 0 failures, 0 errors, 0 skips'
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
end
