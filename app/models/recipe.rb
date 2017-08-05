# require 'byebug'
class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  # accepts_nested_attributes_for :recipe_ingredients
  # accepts_nested_attributes_for :ingredients, allow_destroy: true


  has_attached_file :image, styles: { medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |k, attribute|
      ingredient = Ingredient.find_or_create_by(attribute)
      ingredients << ingredient if ingredient.persisted?
    end
  end


end
