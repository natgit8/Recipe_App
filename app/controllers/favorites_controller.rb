class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(recipe_id: params[:recipe_id], user_id: current_user.id)
    if @favorite.save!
      redirect_to root_path
    else
      render root_path
    end
  end

  # def favorite
  #   @user = current_user
  #   @recipe = Recipe.find(params[:recipe_id])
  #   @user.favorite!(@recipe)
  # end
  #
  # def unfavorite
  #   @user = current_user
  #   @heart = @user.favorites.find_by_recipe_id(params[:recipe_id])
  #   @recipe = Recipe.find(params[:recipe_id])
  #   @favorite.destroy!
  # end

end
