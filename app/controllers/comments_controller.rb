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
      redirect_to recipe_path(@recipe), notice: "Your comment was successfully posted!"
      # render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
    else
      # render :js => "alert('error saving comment');"
      redirect_to recipe_path(@recipe)
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
   end

  # def destroy
	#   @comment = Comment.find(params[:id])
	#   if @comment.destroy
	#     render :json => @comment, :status => :ok
	#   else
	#     render :js => "alert('error deleting comment');"
	#   end
	# end


  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params.require(:comment).permit(:rating, :body, :recipe_id)
  end


end
