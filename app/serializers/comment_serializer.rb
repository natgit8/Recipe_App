class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating
  belongs_to :recipe
end
