$: << File.dirname(__FILE__)

require 'helpers'

class PolymerTest < Test::Unit::TestCase
  context "A Polyrhythm" do
    setup do
      @polyrhythm = Polyrhythm.new(:patterns => [{:time => 4, :body => 'x-x-x-x-'},
                                                 {:time => 6, :body => 'o-o-o-o-o-o-'}])
    end
    
    should "get resolved at the lowest number equally divisible by all patterns" do
      assert_equal @polyrhythm.resolve, 12
    end
  end
  
  context "A Pattern" do
    setup do
      @pattern = Pattern.new(:time => 4, :body => 'o-o-o-o-')
    end
    
    should "contain 2 characters for each beat" do
      assert_equal @pattern.body.length, @pattern.time * 2
    end
  end
end