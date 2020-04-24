class ProjectsController < ApplicationController
  before_action :logged_in_user

  def new
    @project = current_user.projects.build
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "TODO List is created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "TODO List updated"
      redirect_to current_user
    else
      render 'edit'
    end 
  end
 
  def destroy
    current_user.projects.find(params[:id]).destroy
    flash[:success] = "TODO List deleted"
    redirect_to current_user
  end

  private

    def project_params
      params.require(:project).permit(:name, :user_id)
    end
end
