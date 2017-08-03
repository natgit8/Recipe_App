# require 'byebug'
class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  # accepts_nested_attributes_for :recipe_ingredients
  # accepts_nested_attributes_for :ingredients


  has_attached_file :image, styles: { medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  # def ingredients_attributes=(ingredient_attributes)
  #       ingredient_attributes.each do |k, ingredient|
  #       self.ingredients.build(ingredient)
  #   end
  # end

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |k, attribute|
      exists = attributes['id'].present?
      empty = attributes.except(:id).values.all?(&:blank?)
      if attribute exists and empty
        return (!exists and empty)
      else
        self.ingredients.build(attribute)
      end
    end
  end


end
