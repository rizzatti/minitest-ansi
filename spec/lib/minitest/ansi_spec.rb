require 'spec_helper'
require 'minitest/ansi'

module MiniTest
  describe Ansi do
    subject { Ansi.new }

    it 'has a version number' do
      subject.class::VERSION.must_equal MiniTest::AnsiVersion::VERSION
    end

    it 'changes minitest output with use!' do
      subject.object_id.wont_be_same_as MiniTest::Unit.output.object_id
      subject.use!
      subject.object_id.must_be_same_as MiniTest::Unit.output.object_id
    end
  end
end
