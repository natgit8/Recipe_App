class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  accepts_nested_attributes_for :ingredients, allow_destroy: true


  has_attached_file :image, styles: { medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/




  def add_ingredients(params)
    params[:recipe_ingredients_attributes].each do |k, recipe_ingredient|

      if recipe_ingredient[:ingredient_id].present?
        ingredient_name = recipe_ingredient[:ingredient][:name].downcase
         @ingredient = Ingredient.find_or_create_by(name: ingredient_name)

      elsif recipe_ingredient[:ingredient_id].present?
         @ingredient = Ingredient.find_by(id: recipe_ingredient[:ingredient_id])
      end

      if recipe_ingredient[:recipe_id].present?
        RecipeIngredient.create( ingredient_id: ingredient.id, recipe_id: self.id )
      end
    end
  end



end
