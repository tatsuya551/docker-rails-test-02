class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @comment.board, flash[:notice] "メッセージを送信しました" }
        format.json
      end
      # flash[:notice] = "コメントを投稿しました"
      # redirect_to comment.board
    else
      redirect_to :back, flash: {
        comment: @comment,
        error_messages: @comment.errors.full_messages
      }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.board, flash: { notice: "コメントを削除しました" }
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
