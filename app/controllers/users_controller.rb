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


end
