class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find_by(params[:id])
  end
  
  def edit 
    @user = current_user
  end
end
