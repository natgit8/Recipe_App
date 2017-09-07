class CommentSerializer < ActiveModel::Serializer
  attribute :id
  belongs_to :recipe, serializer: RecipeSerializer
end
