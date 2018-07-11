require 'sinatra/base'
require 'rack-flash'

class UsersController < ApplicationController

   use Rack::Flash

   get '/users' do
     @users = User.all
     erb :'/users/index'
   end

  get '/signup' do
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      flash[:message] = "You are already logged in."
      redirect to "/users/#{@user.id}"
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if @user.valid?
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "You must fill out all fields to sign up."
      redirect '/signup'
    end
  end

  get '/login' do
    if Helpers.is_logged_in?(session)
     @user = Helpers.current_user(session)
     flash[:message] = "You are already logged in."
     redirect to "/users/#{@user.id}"
    else
     erb :'/users/login'
    end
  end

  post '/login' do
   @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect "/users/#{@user.id}"
   else
      flash[:message] = "The username or password is incorrect."
      redirect '/login'
   end
 end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
