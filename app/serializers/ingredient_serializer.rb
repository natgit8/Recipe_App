class IngredientSerializer < ActiveModel::Serializer
  attributes :id
  has_many :recipes, serializer: RecipeIngredientSerializer
end
