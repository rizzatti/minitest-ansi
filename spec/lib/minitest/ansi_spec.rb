require 'spec_helper'
require 'minitest/ansi'
require 'stringio'

module MiniTest
  describe Ansi do
    before { @output = MiniTest::Unit.output }
    after { MiniTest::Unit.output = @output }

    subject { Ansi.new }

    it 'has a version number' do
      subject.class::VERSION.must_equal MiniTest::AnsiVersion::VERSION
    end

    it 'changes minitest output with use!' do
      subject.object_id.wont_be_same_as MiniTest::Unit.output.object_id
      subject.use!
      subject.object_id.must_be_same_as MiniTest::Unit.output.object_id
    end

    describe 'printing chars' do
      subject { Ansi.new(StringIO.new) }

      it 'prints . in green' do
        subject.print('.')
        subject.rewind
        subject.read.must_equal "\e[32m.\e[0m"
      end

      it 'prints F in yellow' do
        subject.print('F')
        subject.rewind
        subject.read.must_equal "\e[33mF\e[0m"
      end

      it 'prints E in red' do
        subject.print('E')
        subject.rewind
        subject.read.must_equal "\e[31mE\e[0m"
      end

      it 'prints S in cyan' do
        subject.print('S')
        subject.rewind
        subject.read.must_equal "\e[36mS\e[0m"
      end
    end
  end
end
