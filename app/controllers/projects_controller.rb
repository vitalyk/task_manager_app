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
      redirect_to @project
    else
      render 'new'
    end
  end

  private

    def project_params
      params.require(:project).permit(:name)                                   
    end
end
