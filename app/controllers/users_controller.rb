class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = current_user 
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end
  
  def follows
    @user = User.find(params[:id])
    @users = @user.following_user.reverse_order
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user.reverse_order
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image, :gender_status)
  end
end
