class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :directions
  has_many :ingredients, serializer: RecipeIngredientSerializer
  has_many :comments, serializer: CommentSerializer 

end
