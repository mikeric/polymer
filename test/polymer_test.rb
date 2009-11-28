$: << File.dirname(__FILE__)

require "helpers"

class PolymerTest < Test::Unit::TestCase
  context "A Polyrhythm" do
    setup do
      @polyrhythm = Polyrhythm.new(
        :patterns => [
          {:time => 4, :body => "x-x-x-x-x-x-x-x-"},
          {:time => 8, :body => "o-o-o-o-o-o-"}
        ]
      )
    end
    
    should "have a title displaying all the time signatures" do
      assert_equal "4/4, 6/8 polyrhythm", @polyrhythm.title
    end
    
    should "resolve at the lowest number equally divisible by all patterns" do
      assert_equal 48, @polyrhythm.resolve
    end
  end
  
  context "A Pattern" do
    setup do
      @pattern = Pattern.new(:time => 8, :body => "o-o-o-o-o-o-")
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