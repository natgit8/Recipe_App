class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :directions
  belongs_to :user
  has_many :comments, serializer: CommentSerializer
  

end
