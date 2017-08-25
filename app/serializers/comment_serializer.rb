class CommentSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment
  belongs_to :recipe
  belongs_to :user

end
