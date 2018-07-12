require 'sinatra/base'
require 'rack-flash'

class MountainsController < ApplicationController

  get '/mountains' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @mountains = Mountain.all
      erb :'/mountains/index'
    else
      flash[:message] = "Please signup or login to view that page."
      redirect to '/'
    end
  end

  get '/mountains/:id' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @mountain = Mountain.find(params[:id])
      erb :'/mountains/show'
    else
      flash[:message] = "Please signup or login to view that page."
      redirect to '/'
    end
  end


end
