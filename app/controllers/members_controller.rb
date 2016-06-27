class MembersController < ApplicationController

  before_action :authenticate_user!

  def create
    member = Member.new
    idea = Idea.find params[:idea_id]
    member.user = current_user
    member.idea = idea
    if member.save
      redirect_to idea_path(idea), notice: "Idea Joined"
    else
      redirect_to idea_path(idea), alert: "An Error has occured"
    end
  end

  def destroy
    member = Member.find params[:id]
    idea = Idea.find params[:idea_id]
    member.destroy
    redirect_to idea_path(idea), notice: "Left idea"
  end
end
