$: << File.dirname(__FILE__)

require 'helpers'

class PolymerTest < Test::Unit::TestCase
  context "A Polyrhythm" do
    setup do
      @polyrhythm = Polyrhythm.new
    end
  end
end