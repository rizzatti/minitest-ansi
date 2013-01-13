require 'minitest/autorun'
require 'minitest/ansi'

MiniTest::ANSI.use!

describe "Sample" do
  10.times do
    it "shows passing tests with green dots" do
      true.must_equal true
    end
  end

  it "shows failing tests with yellow Fs" do
    true.wont_equal true
  end

  it "shows errors with red Es" do
    raise "some error"
  end

  it "shows skipped tests with cyan Ss" do
    skip
  end
end
