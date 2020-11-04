class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
    task = Task.find(params[:task_id])
    @comment = task.comments.build
  end

  def create
    binding.pry
    task = task.find(params[:id])
    @comment = task.comments.build(comment_params)

    if @comment.save
      redirect_to task_path(task), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end