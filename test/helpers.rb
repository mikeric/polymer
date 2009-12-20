$: << File.dirname(__FILE__) + '/../lib'

require 'test/unit'
require 'shoulda'
require 'polymer'

class Test::Unit::TestCase
  include Polymer
end