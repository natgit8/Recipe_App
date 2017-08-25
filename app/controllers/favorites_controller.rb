class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(recipe_id: params[:recipe_id], user_id: current_user.id)
    if @favorite.save!
      redirect_to root_path
    else
      render root_path
    end
  end

end
