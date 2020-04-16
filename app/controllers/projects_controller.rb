class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "TODO List is created!"
#      redirect_to @project
      redirect_to projects_url
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:success] = "TODO List updated"
      #redirect_to @project
      redirect_to projects_url
    else
      render 'edit'
    end 
  end
 
  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "TODO List deleted"
    redirect_to projects_url
  end

  private

    def project_params
      params.require(:project).permit(:name)                                   
    end
end
