require "pry"

class StoriesController < ApplicationController
  get "/stories" do
    # binding.pry
    current = User.find_by_id(session[:user_id])
    if current
      @stories = current.stories
      erb :"stories/index"
    else
      flash[:message] = "You must login to see your stories."
      redirect "/login"
    end
  end

  get "/stories/new" do
    erb :"stories/new"
  end

  get "/stories/:id" do
    @user = User.find(session[:user_id])
    @story = Story.find(params[:id])
    if @user
      erb :"stories/show"
    else
      redirect "/login"
    end
  end

  get "/stories/:id/edit" do
    @story = Story.find(params[:id])
    erb :"stories/edit"
  end

  post "/stories" do
    @user = User.find(session[:user_id])
    if @user
      @story = @user.stories.create(params)
      redirect to "/stories"
    else
      redirect "/login"
    end
  end

  # FIX THE UPDATE METHOD TO JUST LET THE USER TO EDIT!

  patch "/stories/:id" do
    user = Story.find_by_id(params[:id]).user
    # @story = Story.find_by_id(params[:id])
    if user.id == current_user.id
      @story = Story.find_by_id(params[:id])
      params.delete("_method")

      if @story.update(params)
        redirect "/stories/#{@story.id}"
      else
        redirect "/stories/#{@story.id}/edit"
      end
    else
      flash[:message] = "You can not edit other users stories."
      redirect "/stories"
    end
    # binding.pry
    # if current_user == @story.user
    #   @story.update(content: params[:content])
    # else
    #   flash[:message] = "You can not edit this content"
    #   erb :"stories/edit"
    # end
    # unless current_user == @story.user
    #   flash[:message] = "You can not edit this content. You must log in."
    #   erb :"stories/show"
    # else
    #   redirect to "/stories"
    # end
  end

  delete "/stories/:id" do
    user = Story.find_by_id(params[:id]).user
    if user.id == current_user.id
      @story = Story.find_by_id(params[:id])
      @story.destroy

      redirect to "/stories"
    else
      flash[:message] = "You can not delete this content."
      redirect "/stories"
    end
  end
end
