class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :create, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path(@task), notice: '保存に成功しました。'
    else
      flash.now[:alert] = '保存に失敗しました。'
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!
    redirect_to tasks_path(@task), notice: '削除しました'
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :eyecatch, :user_id)
    end

    def set_task
      @task = task.find(params[:id])
    end
end