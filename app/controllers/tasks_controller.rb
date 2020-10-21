class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path(@task), notice:'保存に成功しました。'
    else
      flash.now[:alert] = '保存に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :user_id)
    end
end