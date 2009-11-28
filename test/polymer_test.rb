$: << File.dirname(__FILE__)

require 'helpers'

class PolymerTest < Test::Unit::TestCase
  context "A Polyrhythm" do
    setup do
      @polyrhythm = Polyrhythm.new(
        :patterns => [
          {:time => '4/4', :body => 'x-x-x-x-x-x-x-x-'},
          {:time => '6/8', :body => 'o-o-o-o-o-o-'}
        ]
      )
    end
    
    should "resolve at the lowest number equally divisible by all patterns" do
      assert_equal 48, @polyrhythm.resolve
    end
  end
  
  context "A Pattern" do
    setup do
      @pattern = Pattern.new(:time => '4/8', :body => 'o-o-o-o-')
    end
    
    should "have a default resolution of 16" do
      assert_equal 16, @pattern.resolution
    end
    
    should "have a length for the specified resolution" do
      assert_equal @pattern.length, 8
    end
  end
end