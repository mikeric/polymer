$: << File.dirname(__FILE__)

require 'sinatra/base'
require 'dm-core'
require 'dm-validations'
require 'haml'
require 'sass'

require 'polymer/pattern'
require 'polymer/polyrhythm'
require 'polymer/app'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/polymer.db")
DataMapper.auto_upgrade!