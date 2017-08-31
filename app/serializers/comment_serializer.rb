class CommentSerializer < ActiveModel::Serializer
  attribute :body
  belongs_to :recipe, serializer: RecipeSerializer
end
