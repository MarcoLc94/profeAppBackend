class TasksController < ApplicationController
  before_action :set_group, only: [:index, :create]
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /groups/:group_id/tasks
  def index
    render json: @group.tasks
  end

  # GET /tasks/:id
  def show
    render json: @task
  end

  # POST /groups/:group_id/tasks
  def create
    @task = @group.tasks.build(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/:id
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :due_time)
  end
end
