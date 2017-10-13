class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(recipe_id: params[:recipe_id], user_id: current_user.id)
    if @favorite.recipe
      @favorite.save
    #   # redirect_to root_path
    # render json: current_user.favorites
  end
    # else
    #   # render root_path
    # end
  end

end
