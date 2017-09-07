class CommentSerializer < ActiveModel::Serializer
  attribute :id
  belongs_to :recipe
end
