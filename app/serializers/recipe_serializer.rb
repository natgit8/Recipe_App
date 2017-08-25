class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :directions
  belongs_to :user
  has_many :comments, serializer: CommentSerializer
  has_many :ingredients, serializer: IngredientSerializer 
end
