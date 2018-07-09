class ListsController < ApplicationController

  get '/new' do
    erb:'/lists/new'
  end

  post '/lists' do
    @list = List.create(user_id: session[:user_id])
    @list.mountains << Mountain.create(name: params["mountain"]["name"])
    @list.save
    redirect to "users/#{@list.user_id}"
  end

end
