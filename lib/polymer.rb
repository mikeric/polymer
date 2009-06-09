$: << File.dirname(__FILE__) + '/polymer'

require 'dm-core'
require 'models'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/../polymer.sqlite3")
DataMapper.auto_upgrade!