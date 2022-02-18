class CommentsController < ApplicationController
  
  def create
    record = Record.find(params[:record_id])
    comment = current_user.comments.new(comment_params)
    comment.record_id = record.id
    comment.save
    redirect_to record_path(record)
  end
  
  def destroy
    Comment.find_by(id: params[:id], record_id: params[:record_id]).destroy
    redirect_to record_path(params[:record_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end