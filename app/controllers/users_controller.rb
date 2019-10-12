require "pry"

class UsersController < ApplicationController
  get "/login" do
    erb :"users/login"
  end

  post "/login" do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password]) #authenticate password digest to match the real password
      session[:user_id] = @user.id
      # line 21 session is the login line after checking all the lines above.

      redirect to "/stories"
    else
      flash[:message] = "Invalid Email or Password"
      erb :"users/login"
      redirect to "/signup"
    end
    # else
    #   redirect to "/login"
    # end
  end

  get "/signup" do
    erb :"users/signup"
  end

  post "/signup" do
    # binding.pry
    @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
    # erb :"users/signup"
    if session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Username already exists"
      # erb :"users/login"
      redirect to "/login"
    end
  end

  get "/users/:id" do
    @user = User.find_by(session[:user_id])
    erb :"users/show"
  end

  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    @user = User.create(:username => params[:username], :password => params[:password])
    session[:user_id] = @user.id

    # redirect to "/users/#{@user.id}"
    redirect to "/stories"
  end

  get "/logout" do
    session.clear
    redirect to "/"
  end
end
