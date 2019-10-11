require "./config/environment"
require "rack-flash"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "secret"
    use Rack::Flash, :sweep => true
  end

  get "/" do
    "Welcome to My Travel Diaries App!"
    @users = User.all
    @stories = Story.all
    erb :"stories/all"
  end

  helpers do
    def logged_in?
      if current_user
        return true
      else
        return false
      end
    end

    def current_user
      @user = User.find_by_id(session[:user_id])
    end
  end

  def authorized?
    redirect_to login_path unless logged_in?
  end
end
