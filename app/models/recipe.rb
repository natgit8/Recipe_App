class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients
  accepts_nested_attributes_for :ingredients


  has_attached_file :image, styles: { medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def ingredients_attributes=(ingredient)
    ingredient.each do |k, ingredient|
      self.ingredients.build(ingredient)
    end
  end

  # def ingredients_attributes=(ingredients_attributes)
  #   new_ingredients = ingredients_attributes.dig('0', 'name')
  #   return if new_ingredients.blank?
  #
  #   if new_ingredients.include?(',')
  #     parse_ingredients(new_ingredients)
  #   else
  #     ingredient = Ingredient.find_or_create_by(ingredients_attributes['0'])
  #     self.ingredients << ingredient
  #   end
  # end

end
