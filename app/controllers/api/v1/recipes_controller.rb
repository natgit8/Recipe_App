class Api::V1::RecipesController < ApiController
  before_action :find_recipe, only: %i[show edit update destroy description]
  before_action :authenticate_user!, except: %i[index show testing]
  

  def index
    @recipes = Recipe.all.order('created_at DESC')
    render json: @recipes
  end

  # def testing
  #   @recipes = Recipe.all.order('created_at ASC')
  #   render json: @recipes
  # end

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
    # respond_to do |f|
    #   f.html { render :edit }
    #   f.json { render :edit }
    # end
  end

  def favorite(_user)
    @favorites << Favorite.new(user: @user)
    # render json: @favorites
  end

  # unlike the post
  def unfavorite(_user)
    @favorites.where(user_id: @user.id).first.destroy
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
