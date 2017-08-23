class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def new
    @recipe = Recipe.new
    @ingredients = 4.times.collect { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "Your recipe has successfully been added"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Your recipe has successfully been updated"
    else
      render 'edit'
    end
  end

  def show

  end

  def favorite(user)
    @favorites << Favorite.new(user: @user)
  end

# unlike the post
  def unfavorite(user)
    @favorites.where(user_id: @user.id).first.destroy
  end


  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Succesfully deleted recipe"
  end

  # def favorite
  #  type = params[:type]
  #  if type == "favorite"
  #    current_user.favorites << @recipe
  #    redirect_to :back, notice: 'You favorited #{@recipe.name}'
  #
  #  elsif type == "unfavorite"
  #    current_user.favorites.delete(@recipe)
  #    redirect_to :back, notice: 'Unfavorited #{@recipe.name}'
  #
  #  else
  #    # Type missing, nothing happens
  #    redirect_to :back, notice: 'Nothing happened.'
  #   end
  # end


  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, :directions, :ingredient_ids => [],  :ingredients_attributes => [:name])
  end

end
