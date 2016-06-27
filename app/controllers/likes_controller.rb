class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    like = Like.new
    idea = Idea.find params[:idea_id]
    like.user = current_user
    like.idea = idea
    if like.save
      redirect_to idea_path(idea), notice: "Idea Liked"
    else
      redirect_to idea_path(idea), alert: "An Error has occured"
    end
  end

  def destroy
    like = Like.find params[:id]
    idea = Idea.find params[:idea_id]
    like.destroy
    redirect_to idea_path(idea), notice: "Unliked idea"
  end
end
