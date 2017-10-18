class FavoriteSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :recipe
  
end
