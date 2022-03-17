class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @records = Record.preload(:comments, :favorites).eager_load(:user).page(params[:page]).reverse_order
    @records = @records.where("title like? OR magic_name like? OR body like?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  end

  def show
    @record   = Record.find(params[:id])
    @comment  = Comment.new
    @comments = @record.comments
  end
  
  def new
    @record = Record.new
  end
  
  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save
      redirect_to record_path(@record), notice: "投稿に成功しました。"
    else
      render :new
    end
  end

  def edit
    @record = Record.find(params[:id])
    if @record.user_id != current_user.id
      redirect_to record_path, alert: '不正なアクセスです。'
    end
  end
  
  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to record_path(@record), notice: "更新に成功しました。"
    else
      render :edit
    end
  end
  
  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to records_path
  end
  
  private
  def record_params
    params.require(:record).permit(:title, :magic_name, :body, :time_status, :audience_status)
  end
end
