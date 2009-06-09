$: << File.dirname(__FILE__)

require 'helpers'

class PolymerTest < Test::Unit::TestCase
  context "A Polyrhythm" do
    setup do
      @polyrhythm = Polyrhythm.new
      @polyrhythm.patterns.build(:time => 4, :pattern => 'o-oo-oo-')
      @polyrhythm.patterns.build(:time => 6, :pattern => 'oo-o-o-o--o-')
    end
    
    should "get resolved at the lowest number equally divisible by all patterns" do
      assert_equal @polyrhythm.resolve, 12
    end
  end
end