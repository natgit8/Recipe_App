class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show edit update destroy next]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @recipes = Recipe.all.order('created_at ASC')
    respond_to do |f|
      f.html
      f.json { render json: @recipes }
    end
  end

  def next
    @next_recipe = @recipe.next
    render json: @next_recipe 
  end

  def new
    @recipe = Recipe.new
    @ingredients = Array.new(5) { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Your recipe has successfully been added'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Your recipe has successfully been updated'
    else
      @recipe.save
      render json: @recipe
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @recipe }
    end
  end

  def edit
  end

  def favorite
   type = params[:type]
   if type == "favorite"
     current_user.favorites << @recipe
     redirect_to :back
   elsif type == "unfavorite"
     current_user.favorites.delete(@recipe)
     redirect_to :back
   else
     redirect_to :back
   end
 end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: 'Succesfully deleted recipe'
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, :directions, ingredient_ids: [], ingredients_attributes: [:name])
  end
end
