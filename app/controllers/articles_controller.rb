class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, except: [:index, :information, :learning, :qanda, :show]
  def index
    @articles = Article.preload(:remarks)
  end

  def show
    @article = Article.find(params[:id])
    @remark  = Remark.new
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
    if @article.user_id != current_user.id
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
    @articles = Article.information.preload(:remarks)
  end

  def learning
    @articles = Article.learning.preload(:remarks)
  end

  def qanda
    @articles = Article.qanda.preload(:remarks)
  end  

  private
  def article_params
    params.require(:article).permit(:title, :body, :article_status, :article_image)
  end
  def admin_user
    redirect_to root_path, alert: '不正なアクセスです。' unless current_user.admin?
  end
end