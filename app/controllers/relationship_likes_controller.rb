class RelationshipLikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = current_user
    @micropost = Micropost.find(params[:micropost_id])
    current_user.like(@micropost)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_url) }
      format.js
    end
  end

  def destroy
    @user = current_user
    @micropost = RelationshipLike.find(params[:id]).micropost
    current_user.unlike(@micropost)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_url) }
      format.js
    end
  end
end
