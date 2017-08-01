require 'byebug'
class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients << Ingredient.new
    6.times.collect { @recipe.ingredients.build }
  end

  def edit
    3.times.collect { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.ingredients << Ingredient.new
    if @recipe.save
      redirect_to @recipe, notice: "Successfully created new recipe"
    else
      render 'new'
    end
  end

  def show
    @ingredient = Ingredient.new
    @recipe.ingredients << @ingredient
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Succesfully deleted recipe"
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :image, ingredient_ids: [], ingredients_attributes: [:name, :quantity])
  end

end
