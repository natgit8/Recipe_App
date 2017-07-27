class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def ingredient_ids=(ingredient_ids)
    i = Ingredient.find(ingredient_ids)
    @recipe.ingredients << i
  end

  def ingredient_attributes=(ingredient_attributes)
    @recipe.ingredients.each do |ingredient|
      ingredient.name
    end
  end


end
