$: << File.dirname(__FILE__) + '/polymer'

require 'datamapper'
require 'models'
require 'enumerator'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/polymer.db")
DataMapper.auto_upgrade!