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
    if @task.update(params.require(:task).permit(:name))
      flash[:success] = "Task updated"
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

  def toggle
    @task = get_project.tasks.find(params[:id])
    respond_to do |format|
      status = params[:status] ? 1 : 0
      if @task.update(status: status)
        format.html { redirect_to root_url, notice: "Status was successfully updated: #{status}" }
      else
        format.html { redirect_to root_url, notice: "FAIL" }
      end
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
