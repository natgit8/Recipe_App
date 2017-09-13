class CommentSerializer < ActiveModel::Serializer
  attribute :id, :body, :rating
  belongs_to :recipe
end
