class FavoritesController < ApplicationController

  # skip_before_action
  skip_before_action :login_forbided

  def create
    @favorite = current_user.favorites.new(picture_id: params[:picture_id])
    @favorite.save
    redirect_to picture_path(@favorite.picture_id)
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    @favorite.destroy
    redirect_to picture_path(@favorite.picture_id)
  end

end
