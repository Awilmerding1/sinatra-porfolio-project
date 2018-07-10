require 'sinatra/base'
require 'rack-flash'

class MountainsController < ApplicationController

  get '/mountains' do
    @mountains = Mountain.all
    erb :'/mountains/index'
  end

  get '/mountains/:id' do
    @mountain = Mountain.find(params[:id])
    erb :'/mountains/show'
  end


end
