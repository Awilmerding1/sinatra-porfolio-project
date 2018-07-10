require 'sinatra/base'
require 'rack-flash'

class ListsController < ApplicationController

  get '/new' do
    @mountains = Mountain.all
    erb:'/lists/new'
  end

  post '/lists' do
    @list = List.create(user_id: session[:user_id])
    @list.mountain_ids = params[:mountains]
    @list.save
    redirect to "users/#{@list.user_id}"
  end


end
