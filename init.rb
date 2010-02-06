require 'lib/polymer'

Polymer::App.set :environment, ENV['RACK_ENV'] || :development

MongoMapper.connection = Mongo::Connection.new(
  ENV['MONGOHQ_HOST'] || 'localhost',
  ENV['MONGOHQ_PORT']
)

MongoMapper.database = "polymer-#{Polymer::App.environment}"

if ENV['MONGOHQ_USERNAME'].present?
  MongoMapper.database.authenticate(
    ENV['MONGOHQ_USERNAME'],
    ENV['MONGOHQ_PASSWORD']
  )
end