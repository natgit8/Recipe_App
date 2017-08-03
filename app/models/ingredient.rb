class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, uniqueness: { case_sensitive: false },
                    allow_nil: true,
                    allow_blank: true

  # validates :name, unless: Proc.new { |a| a.name.blank? }

end
