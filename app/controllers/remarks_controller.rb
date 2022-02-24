class RemarksController < ApplicationController
  
  def create
    article = Article.find(params[:article_id])
    remark = current_user.remarks.new(remark_params)
    remark.article_id = article.id
    remark.save
    redirect_to article_path(article)
  end

  def destroy
    Remark.find_by(id: params[:id], article_id: params[:article_id]).destroy
    redirect_to article_path(params[:article_id])
  end

  private
  def remark_params
    params.require(:remark).permit(:remark)
  end
end
