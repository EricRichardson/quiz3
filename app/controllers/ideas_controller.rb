class IdeasController < ApplicationController

  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def new
    @idea = Idea.new
  end

  def create
    idea = Idea.new idea_params
    idea.user = current_user
    if idea.save
      redirect_to idea_path(idea), notice: "Idea made"
    else
      render :new
    end
  end

  def show
  end

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: "Idea deleted"
  end

  private
    def idea_params
      params.require(:idea).permit(:title, :body)
    end

    def find_idea
      @idea = Idea.find params[:id]
    end
end
