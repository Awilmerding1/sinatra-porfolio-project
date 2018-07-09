require 'sinatra/base'
require 'rack-flash'

class UsersController < ApplicationController

   use Rack::Flash

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if !User.find_by(username: params[:username]) && params[:password] != "" && params[:email] != "" && params[:username] != ""
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Please create an account."
      redirect '/signup'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
   @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
      @tweets = Tweet.all
     redirect '/tweets'
   else
      flash[:message] = "The username or password is incorrect."
      redirect '/login'
   end
 end
 

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end


end
