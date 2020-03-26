class MicropostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @microposts = Micropost.all
    @micropost = Micropost.new
  end
  
  def new
    @micropost = current_user.microposts.build
  end 
  
  def show
    @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments
    @comment = @micropost.comments.new(user_id: current_user.id) if current_user
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "新しい投稿をしました"
      redirect_to root_url
    else
      @q = Micropost.none.ransack
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'home/top'
    end
  end
  
  def destroy
    @micropost = Micropost.find(params[:id])
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
