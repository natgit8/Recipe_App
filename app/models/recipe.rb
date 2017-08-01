class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}
  # accepts_nested_attributes_for :recipe_ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}


  has_attached_file :image, styles: { medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


   def ingredients_attributes=(ingredients_attributes)
    new_ingredients = ingredients_attributes.dig('0', 'name')
    return if new_ingredients.blank?

    if new_ingredients.include?(',')
      parse_ingredients(new_ingredients)
    else
      ingredient = Ingredient.find_or_create_by(ingredients_attributes['0'])
      self.ingredients << ingredient
    end
  end


  # def add_ingredients(params)
  #
  # params[:recipe_ingredients_attributes].each do |k, recipe_ingredient|
  #
  #     if recipe_ingredient[:ingredient][:name].present?
  #       ingredient = Ingredient.find_or_create_by(name: ingredient_name)
  #
  #     elsif recipe_ingredient[:ingredient_id].present?
  #       ingredient = Ingredient.find_by(id: recipe_ingredient[:ingredient_id])
  #     end
  #
  #     if recipe_ingredient[:quantity].present?
  #       RecipeIngredient.create(quantity: recipe_ingredient[:quantity], ingredient_id: ingredient.id, recipe_id: self.id )
  #     end
  #   end
  # end


end