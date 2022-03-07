class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:destroy]
  def index
    @users = User.preload(:records)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end
  
  def follows
    @user  = User.find(params[:id])
    @users = @user.following_user.reverse_order
  end
  
  def followers
    @user  = User.find(params[:id])
    @users = @user.follower_user.reverse_order
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image, :gender_status)
  end
end
