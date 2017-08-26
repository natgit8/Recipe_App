class CommentsController < ApplicationController
before_action :find_recipe

  def new
    @comment = Comment.new
  end

  def create
    @comment = @recipe.comments.build(comment_params)
    @comment.user_id = current_user.id
    # byebug
    if @comment.save
      # redirect_to recipe_path(@recipe), notice: "Your comment was successfully posted!"
      respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.js
    end 
    else
      redirect_to recipe_path(@recipe), notice: "Your comment wasn't posted!"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
   end


  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params.require(:comment).permit(:rating, :body, :recipe_id)
  end


end
