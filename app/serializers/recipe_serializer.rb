class RecipeSerializer < ActiveModel::Serializer
  attributes :name, :description, :directions
  has_many :ingredients, serializer: RecipeIngredientSerializer
  has_many :comments, serializer: RecipeCommentSerializer

end
