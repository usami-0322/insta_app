class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :update, :edit,:destroy,
                                            :following, :followers, :likes]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @micropost = Micropost.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  def edit
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
  
  def following
    @title = "フォロー"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "フォロワー"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def likes
    @title = "いいね"
    @user = User.find(params[:id])
    @microposts = @user.likes.paginate(page: params[:page])
    render 'show_like'
  end


    private
    
      def user_params
        params.require(:user).permit(:password, :password_confirmation, :current_password)
      end
      
      def correct_user
        @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
      end
end