if ENV['MONGOHQ_URL']
  MongoMapper.config = {PADRINO_ENV => {'uri' => ENV['MONGOHQ_URL']}}
else
  MongoMapper.config = {PADRINO_ENV => {'uri' => "mongodb://localhost/padrino-#{PADRINO_ENV}"}}
end

MongoMapper.connect(PADRINO_ENV)