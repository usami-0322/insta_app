class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :current_user
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = current_user
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
end
