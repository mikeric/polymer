Polymer.controllers do
  get '/stylesheet' do
    content_type 'text/css', :charset => 'utf-8'
    sass :master
  end
  
  get '/' do
    haml :new
  end
  
  get '/:id' do
    @composition = Composition.find(params[:id])
    @patterns = @composition.patterns
    haml :show
  end
  
  post '/' do
    @composition = Composition.new(params[:composition])
    
    if @composition.save
      redirect "/#{@composition.id}"
    else
      redirect '/new'
    end
  end
end