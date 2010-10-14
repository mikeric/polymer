require 'rubygems'
require 'uri'
require 'lib/polymer'

Polymer::App.set :environment, (ENV['MONGOHQ_URL'] ? :production : :development)

if ENV['MONGOHQ_URL']
  MongoMapper.config = {Polymer::App.environment => {'uri' => ENV['MONGOHQ_URL']}}
else
  MongoMapper.connection = Mongo::Connection.new('localhost')
  MongoMapper.database = "polymer-#{Polymer::App.environment}"
end