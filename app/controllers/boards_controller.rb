class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
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

  # def edit
  #   @board = Board.find(params[:id])
  # end

  # def update
  # end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end
end
