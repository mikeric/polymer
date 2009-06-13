$: << File.dirname(__FILE__) + '/lib'

require 'rubygems'
require 'sinatra'
require 'haml'
require File.dirname(__FILE__) + '/lib/polymer'

get '/' do
  haml :index
end

get '/stylesheet' do
  content_type 'text/css', :charset => 'utf-8'
  sass :master
end

get '/new' do
  haml :new
end

post '/new' do
  @polyrhythm = Polyrhythm.new(params[:polyrhythm])
  if @polyrhythm.save
    redirect "/#{@polyrhythm.id}"
  else
    redirect '/new'
  end
end

get '/:id' do |id|
  @polyrhythm = Polyrhythm.get(id)
  if @polyrhythm
    haml :show
  else
    redirect '/'
  end
end

helpers do
  def mark_pattern(pattern)
    pattern.pattern.gsub(/(^.)/, '<span class="mark">\1</span>')
  end
end