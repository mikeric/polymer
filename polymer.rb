$: << File.dirname(__FILE__) + '/lib'

require 'rubygems'
require 'sinatra'
require 'polymer'

get '/' do
  "Polymer!"
end