require 'sinatra/base'
require 'rack-flash'

class HikesController < ApplicationController

  get '/hikes' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @hikes = Hike.all
      erb :'/hikes/index'
    else
      flash[:message] = "Please signup or login to view that page."
      redirect to '/'
    end
  end

  get '/hikes/new' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @mountains = Mountain.all
      erb:'/hikes/new'
    else
      flash[:message] = "Please signup or login to view that page."
      redirect to '/'
    end
  end

  post '/hikes' do
    if params[:mountains] != nil
      params[:mountains].each do |mountain|
        @hike = Hike.create(user_id: session[:user_id])
        @hike.mountain_ids = mountain
        @hike.save
      end
    else
      flash[:message] = "You must select at least one mountain."
      redirect to "hikes/new"
    end
    flash[:message] = "Click a hike to add details about your experience!"
    redirect to "users/#{@hike.user.slug}"
  end

  get '/hikes/:id' do
    if Helpers.is_logged_in?(session)
      @hike = Hike.find(params[:id])
      erb :'/hikes/show'
    else
      flash[:message] = "Please signup or login to view that page."
      redirect to '/'
    end
  end

  get '/hikes/:id/edit' do
    if Helpers.is_logged_in?(session)
     @user = Helpers.current_user(session)
     @hike = Hike.find(params[:id])
     @mountains = Mountain.all
     if @user.hikes.include?(@hike)
       erb:'/hikes/edit'
     else
       flash[:message] = "You may not edit another user's hike."
       redirect to '/hikes'
     end
    else
      flash[:message] = "Please signup or login to view that page."
      redirect to '/'
    end
  end

  patch '/hikes/:id' do
    @hike = Hike.find(params[:id])
    if @hike.user == Helpers.current_user(session)
      @hike.description = params[:description]
      @hike.save
      redirect to "/users/#{@hike.user.slug}"
    else
      flash[:message] = "You may not edit another user's hike."
      redirect to '/hikes'
    end
  end

  delete '/hikes/:id/delete' do
	   @hike = Hike.find(params[:id])
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      if @user.hikes.include?(@hike)
        @hike.delete
        redirect to "users/#{@user.slug}"
      else
        flash[:message] = "You may not delete another user's hike."
        redirect to '/hikes'
      end
    else
      flash[:message] = "Please signup or login to view that page."
      redirect to '/'
    end
	end


end
