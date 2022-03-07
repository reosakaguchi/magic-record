class RemarksController < ApplicationController
  
  def create
    @article = Article.find(params[:article_id])
    @remark = current_user.remarks.new(remark_params)
    @remark.article_id = @article.id
    if @remark.save
      flash.now[:notice] = '投稿に成功しました。'
      render :article_remarks
    else
      render :error
    end
  end

  def destroy
    Remark.find_by(id: params[:id], article_id: params[:article_id]).destroy
    flash.now[:notice] = '投稿を削除しました。'
    #renderしたときに@articleのデータがないので@articleを定義
    @article = Article.find(params[:article_id])
    render :article_remarks
  end

  private
  def remark_params
    params.require(:remark).permit(:remark)
  end
end
