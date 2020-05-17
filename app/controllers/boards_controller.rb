class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    Board.create(board_params)
    redirect_to root_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
