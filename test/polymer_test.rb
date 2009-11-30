$: << File.dirname(__FILE__)

require "helpers"

class PolymerTest < Test::Unit::TestCase
  context "A Polyrhythm" do
    setup do
      @polyrhythm = Polyrhythm.new(
        :patterns => [
          {:time => 4, :body => "x-o-o-o-"},
          {:time => 8, :body => "x-o-o-o-o-o-"}
        ]
      )
    end
    
    should "have a title displaying all the time signatures" do
      assert_equal "2/4, 6/8 polyrhythm", @polyrhythm.title
    end
    
    should "resolve at the lowest number equally divisible by all patterns" do
      assert_equal 24, @polyrhythm.resolve
    end
    
    should "be able to generate measures from the patterns" do
      m = [["|<span>x</span>-o-o-o-|<span>x</span>-o-o-o-|<span>x</span>-o-o-o-",
            "|<span>x</span>-o-o-o-|o-o-<span>x</span>-o-|o-o-o-o-"]]
      
      assert_equal m, @polyrhythm.measures
    end
  end
  
  context "A Pattern" do
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