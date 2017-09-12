class CommentSerializer < ActiveModel::Serializer
  attribute :id
  belongs_to :recipe, serializer: RecipeCommentSerializer
end
