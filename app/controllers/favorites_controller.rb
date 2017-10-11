class FavoritesController < ApplicationController
  before_action :require_user_logged_in 

  def create
    micropost = Micropost.find(params[:micropost_id]) 
    current_user.set_favorite(micropost) 
    flash[:success] = 'お気に入りに登録しました。' 
    redirect_to user_path(micropost.user_id)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id]) 
    current_user.unset_favorite(micropost) 
    flash[:success] = 'お気に入りを外しました。' 
    redirect_to user_path(micropost.user_id)
  end
end
