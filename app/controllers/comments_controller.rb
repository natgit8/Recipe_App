class CommentsController < ApplicationController
  before_action :find_recipe, :find_recipe_comment

  def index
    @comments = @recipes.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @recipe.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to recipe_path(@recipe), notice: 'Your comment was successfully posted!'
    end
  end

  def show
  end

  def destroy
    # @recipe = Recipe.find(params[:recipe_id])
    # @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      # format.html
      format.html { redirect_to(recipe_path(id: params[:recipe_id])}
      format.json { render json: @recipe, :layout => false }
      format.js
    end
   end

  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def find_recipe_comment
    @comment = @recipe.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:rating, :body, :recipe_id)
  end
end
