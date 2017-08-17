class CommentsController < ApplicationController

  def create
    @comment = Recipe.find(params[:recipe_id]).comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to recipe_path(@recipe)
    end 
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
   end


  private

  def comment_params
    params.require(:comment).permit(:rating, :body, :recipe_id)
  end


end
