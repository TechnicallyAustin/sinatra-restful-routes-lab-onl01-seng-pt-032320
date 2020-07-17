class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

get '/' do
  redirect '/recipe'
end

get '/recipe' do 
  @recipes = Recipe.all
  erb :index 
end

get '/recipe/new' do 
erb :new
end

post '/recipe' do 
  @recipes = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  redirect '/recipes/#{@recipes.id}'
end


end
