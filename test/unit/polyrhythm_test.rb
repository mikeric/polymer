$: << File.dirname(__FILE__) + '/..'

require "helpers"

class PolyrhythmTest < Test::Unit::TestCase
  context "polyrhythm" do
    setup do
      @polyrhythm = Polyrhythm.new(
        :patterns => [
          {:time => 4, :body => "x-o-o-o-"},
          {:time => 8, :body => "x-o-o-o-o-o-"}
        ]
      )
    end
    
    should "have a title displaying all unique time signatures" do
      @polyrhythm.patterns << Pattern.new(:time => 8, :body => "x-o-o-x-o-o-")
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
end