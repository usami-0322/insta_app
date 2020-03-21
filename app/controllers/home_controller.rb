class HomeController < ApplicationController
  def top
    if user_signed_in?
      @micropost = current_user.microposts.build
      if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
        @q = current_user.feed.ransack(microposts_search_params)
        @feed_items = @q.result.paginate(page: params[:page])
      else
        @q = Micropost.none.ransack
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
      @url = root_path
    end
  end
  
  def about
  end
  
  def policy
  end
  
  private
  def microposts_search_params
    params.require(:q).permit(:content_cont)
  end
end
