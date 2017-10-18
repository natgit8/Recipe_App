class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(recipe_id: params[:recipe_id], user_id: current_user.id)
    if @favorite.save
      # binding.pry
      respond_to do |format|
        format.html
        format.json{ render :json }
      end
    end
  end

end
