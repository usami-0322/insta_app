class HomeController < ApplicationController
  def top
    if user_signed_in?
      @micropost = current_user.microposts.build 
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
  def about
  end
  
  def policy
  end
end
