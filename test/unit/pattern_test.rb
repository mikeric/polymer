$: << File.dirname(__FILE__) + '/..'

require "helpers"

class PatternTest < Test::Unit::TestCase
  context "pattern" do
    setup do
      @pattern = Pattern.new(:time => 8, :body => "x-o-o-o-o-o-")
    end
    
    should "have a default resolution of 16" do
      assert_equal 16, @pattern.resolution
    end
    
    should "have a time signature" do
      assert_equal "6/8", @pattern.time_signature
    end
    
    should "know how many beats are in the pattern" do
      assert_equal 6, @pattern.beats
    end
  end
end