require 'sinatra/base'
require 'rack-flash'

class HikesController < ApplicationController

  get '/hikes' do
    @hikes = Hike.all
    erb :'/hikes/index'
  end

  get '/hikes/new' do
    @mountains = Mountain.all
    erb:'/hikes/new'
  end

  post '/hikes' do
    params[:mountains].each do |mountain|
      @hike = Hike.create(user_id: session[:user_id])
      @hike.mountain_ids = mountain
      @hike.save
    end
    flash[:message] = "Click a hike to add details about your experience!"
    redirect to "users/#{session[:user_id]}"
  end

  get '/hikes/:id' do
    @hike = Hike.find(params[:id])
    erb :'/hikes/show'
  end

  get '/hikes/:id/edit' do
    @hike = Hike.find(params[:id])
    @mountains = Mountain.all
    erb:'/hikes/edit'
  end

  patch '/hikes/:id' do
    @hike = Hike.find(params[:id])
    @hike.description = params[:description]
    @hike.save
    redirect to "/users/#{@hike.user_id}"
  end


end
