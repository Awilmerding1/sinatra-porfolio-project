require 'sinatra/base'
require 'rack-flash'

class ListsController < ApplicationController

  get '/new' do

    erb:'/lists/new'
  end

  post '/lists' do
    @list = List.create(user_id: session[:user_id])

    redirect to "users/#{@list.user_id}"
  end

end
