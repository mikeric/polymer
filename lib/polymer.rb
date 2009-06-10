$: << File.dirname(__FILE__) + '/polymer'

require 'datamapper'
require 'models'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/polymer.db")
DataMapper.auto_upgrade!