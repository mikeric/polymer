$: << File.dirname(__FILE__)

require 'datamapper'
require 'enumerator'

require 'polymer/polyrhythm'
require 'polymer/pattern'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/polymer.db")
DataMapper.auto_upgrade!