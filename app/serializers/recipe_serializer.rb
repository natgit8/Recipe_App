class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :description, :directions, :ingredients, :comments, :favorites 
   has_many :ingredients
   has_many :comments
   has_many :favorites

end
