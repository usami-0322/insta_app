class MicropostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "新しい投稿をしました"
      redirect_to root_url
    else
      @feed_items = []
      render 'home/top'
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:succsess] = "投稿削除"
    redirect_to request.referrer || root_url
  end
  
  private
  
  def micropost_params
      params.require(:micropost).permit(:content, :picture)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
