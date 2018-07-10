require 'sinatra/base'
require 'rack-flash'

class ListsController < ApplicationController

  get '/lists/new' do
    @mountains = Mountain.all
    erb:'/lists/new'
  end

  post '/lists' do
    @list = List.create(user_id: session[:user_id])
    @list.mountain_ids = params[:mountains]
    @list.save
    redirect to "lists/#{@list.id}/edit"
  end

  get '/lists/:id/edit' do
    @list = List.find(id: session[:user_id])
    @mountains = Mountain.all
    erb:'/lists/edit'
  end

  patch '/lists/:id' do
    @list = List.find(id: session[:user_id])
    @list.description = params[:description]
    @list.mountain_ids = params[:mountains]
    @list.save
    redirect to "/users/#{@list.user_id}"
  end


end
