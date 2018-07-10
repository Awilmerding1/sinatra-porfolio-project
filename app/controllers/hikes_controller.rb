require 'sinatra/base'
require 'rack-flash'

class HikesController < ApplicationController

  get '/hikes/new' do
    @mountains = Mountain.all
    erb:'/hikes/new'
  end

  post '/hikes' do
    @hike = Hike.create(description: params[:description], user_id: session[:user_id])
    @hike.mountain_ids = params[:mountains]
    @hike.save
    redirect to "hikes/#{@hike.id}/edit"
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
    redirect to "/hikes/#{@hike.id}"
  end


end
