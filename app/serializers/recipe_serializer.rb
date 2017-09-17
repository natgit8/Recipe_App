class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :directions, :ingredients, :comments
   has_many :ingredients
   has_many :comments

end
