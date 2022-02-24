class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @remark = Remark.new
    @remarks = @article.remarks
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article), notice: "投稿に成功しました。"
    else
      render :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
    if @article.user_id != current_user.id #ログインしてたらアクセスできる
      redirect_to article_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "更新に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  
  def information
    @articles = Article.information
  end

  def learning
    @articles = Article.learning
  end

  def qanda
    @articles = Article.qanda
  end  

  private
  def article_params
    params.require(:article).permit(:title, :body, :article_status, :article_iamge)
  end
end