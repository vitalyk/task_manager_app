class TasksController < ApplicationController
  before_action :get_project
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
    @task = @project.tasks.build
  end

  def edit
    @task = get_project.tasks.find(params[:id])
  end

  def update
    @task = get_project.tasks(params[:id])
    if @task.update(params.require(:task).permit(:name))
      flash[:success] = "task updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def create
    @task = @project.tasks.build(params.permit(:name))
    if @task.save
      flash[:success] = "Task created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    @project = get_project
    @task = @project.tasks.find(params[:id])
    @task.destroy
    flash[:success] = "Task deleted"
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.json { head :no_content }
    end
  end

  private
    def get_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end
end
