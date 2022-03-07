class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @record  = Record.find(params[:record_id])
    @comment = current_user.comments.new(comment_params)
    @comment.record_id = @record.id
    if @comment.save
      flash.now[:notice] = '投稿に成功しました。'
      render :record_comments
    else
      render :error
    end
  end
  
  def destroy
    Comment.find_by(id: params[:id], record_id: params[:record_id]).destroy
    flash.now[:notice] = '投稿を削除しました。'
    #renderしたときに@recordのデータがないので@recordを定義
    @record = Record.find(params[:record_id])
    render :record_comments
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
