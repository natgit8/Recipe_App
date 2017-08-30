class CommentsController < ApplicationController
  before_action :find_recipe

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
    # 1st you retrieve the post thanks to params[:post_id]
    @recipe = Recipe.find(params[:recipe_id])
    # 2nd you retrieve the comment thanks to params[:id]
    @comment = recipe.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @comment }
    end
 end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to(recipe_path(id: params[:recipe_id])) }
      format.js
    end
   end

  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params.require(:comment).permit(:rating, :body, :recipe_id)
  end
end
