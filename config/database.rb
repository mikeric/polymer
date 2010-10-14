MongoMapper.connection = Mongo::Connection.new('localhost', nil, :logger => logger)

case Padrino.env
  when :development then MongoMapper.database = 'polymer_development'
  when :production  then MongoMapper.database = 'polymer_production'
  when :test        then MongoMapper.database = 'polymer_test'
end
