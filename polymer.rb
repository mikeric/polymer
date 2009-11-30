$: << File.dirname(__FILE__)

require 'sinatra'
require 'haml'
require 'sass'

require 'lib/polymer'

get '/' do
  haml :new
end

get '/stylesheet' do
  content_type 'text/css', :charset => 'utf-8'
  sass :master
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
    @patterns = @polyrhythm.patterns
    haml :show
  else
    redirect '/'
  end
end