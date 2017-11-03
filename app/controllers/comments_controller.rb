class CommentsController < ApplicationController
  before_action :find_recipe

  # def index
  #   @comments = @recipes.comments
  # end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @recipe.comments.build(comment_params)
    # binding.pry
    @comment.user_id = current_user.id
    if @comment.save
      # redirect_to recipe_path(@recipe), notice: 'Your comment was successfully posted!'
      render 'comments/show', :layout => false
      # render json: @comment
    else
      render 'recipes/show'
    end
  end

  def show
  end

  def destroy

    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    # redirect_to recipe_path(@recipe)
    render json: @recipe.comments
    # render 'comments/destroy', :layout => false
    #{}, status: :no_content
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params.require(:comment).permit(:rating, :body, :recipe_id)
  end
end
