class TasksController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

	def new
		@task = Task.new
  	@users = User.where(active: true)
	end

	def create
		@task = Task.new(task_params)
		@task.active = true
  	@task.status = "Task created"
  	@task.created_by = current_user.id
    if @task.save
      redirect_to tasks_path, flash: { success: 'Task created successfully' }
    else
      render :new
    end
  end

  def index
  	@task = Task.where(active: true, user_id: current_user.id)
	end

	def accept_task
		@task = Task.where(id: params[:task_id]).update(status: "Task Accepted")
      redirect_to tasks_path, flash: { success: 'Task Accepted successfully' }
	end

	def task_in_progress
		@task = Task.where(id: params[:task_id]).update(status: "Task in progess")
      redirect_to tasks_path, flash: { success: 'Marked Task in progess' }
	end

	def not_accept_task
		@task = Task.where(id: params[:task_id]).update(status: "Task not accept")		
      redirect_to tasks_path, flash: { success: 'Task rejected' }
	end

	def task_completed
		@task = Task.where(id: params[:task_id]).update(status: "Task completed")
      redirect_to tasks_path, flash: { success: 'Task completed successfully' }
	end

  def task_params
    params.require(:task).permit(:title, :description, :deadline, :user_id)
  end
end
