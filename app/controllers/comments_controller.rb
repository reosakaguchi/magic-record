class CommentsController < ApplicationController
  
  def create
    @record = Record.find(params[:record_id])
    @comment = current_user.comments.new(comment_params)
    @comment.record_id = @record.id
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
      render :record_comments  #render先にjsファイルを指定
    else
      render 'records/show'
    end
  end
  
  def destroy
    Comment.find_by(id: params[:id], record_id: params[:record_id]).destroy
    flash.now[:alert] = '投稿を削除しました'
    #renderしたときに@recordのデータがないので@recordを定義
    @record = Record.find(params[:record_id])
    render :record_comments  #render先にjsファイルを指定
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
