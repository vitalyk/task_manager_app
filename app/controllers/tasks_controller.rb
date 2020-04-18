class TasksController < ApplicationController
  before_action :get_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @task = @project.tasks.build
  end

  def edit
  end

  def create
    @task = @project.tasks.build(params.permit(:name))

    respond_to do |format|
      if @task.save
        flash[:success] = "Task created!"
        format.html { redirect_to root_url }
        format.json { render :projects_url, status: :created, location: @task  }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
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

    def task_params

    end
end
