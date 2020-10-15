class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path(@board), notice: '保存に成功しました。'
    else
      flash.now[:alert] = '保存に失敗しました。'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to boards_path(@board), notice: '更新出来ました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to boards_path(@board), notice: '削除しました'
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end
end
