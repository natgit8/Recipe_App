class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :directions
  has_many :ingredients
  has_many :comments, serializer: RecipeCommentSerializer

end
