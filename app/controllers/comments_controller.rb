class CommentsController < ApplicationController
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = micropost.comment.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:denger] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
  
    private
  
  def commnt_params
    params.require(:comment).parmit(:content)
  end
end
