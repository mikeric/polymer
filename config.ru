require 'rubygems'
require 'lib/polymer'

Polymer::App.set :environment, ENV["RACK_ENV"] || :production

run Polymer::App