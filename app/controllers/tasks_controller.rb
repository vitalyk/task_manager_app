class TasksController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
  end
end
