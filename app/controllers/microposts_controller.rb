class MicropostsController < ApplicationController
  bfore_action :user_signed_id, only: [:create, :destroy]
  
  def createt
    @maicropost = current_user.microposts.build(micropost_params)
  end
  
  def destroy
  end
  
  privete
  
  def micropost_params
    params.require(:user).permit(:content)
  end
end
