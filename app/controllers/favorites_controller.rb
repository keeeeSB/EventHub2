class FavoritesController < ApplicationController
  before_action :require_login

  def index
    @favorite_events = current_user.favorites.include(:event).order('events.start_time ASC').map(&:event)
  end

  def create
    favorite = current_user.favorites.build(event_id: params[:event_id])
    favorite.save
    flash[:success] = "お気に入り登録しました。"
    redirect_to root_path
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy!
    flash[:success] = "お気に入り登録を解除しました。"
    redirect_to root_path, status: :see_other
  end
end
