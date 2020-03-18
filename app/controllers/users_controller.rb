class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :update, :following, :followers]
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def update
    @user = current_user
    if params[:user][:password].empty?
      @user.errors.add(:password,:blank)
      render 'edit'
    elsif @user.update_with_password(user_params)
      flash[:success] = "パスワードを変更しました"
      bypass_sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
