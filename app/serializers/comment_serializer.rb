class CommentSerializer < ActiveModel::Serializer
  attributes :id, :rating, :body
  belongs_to :recipe
  belongs_to :user

end
