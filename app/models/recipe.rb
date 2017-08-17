# require 'byebug'
class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments

  # accepts_nested_attributes_for :ingredients, allow_destroy: true

  scope :most_recent, -> { order(created_at: :desc)}
  scope :created_within, ->(time, occurred_at) { where("created_at > ? AND created_at < ?", time, occurred_at) }



  has_attached_file :image, styles: { medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |k, attribute|
      ingredient = Ingredient.find_or_create_by(attribute)
      ingredients << ingredient if ingredient.persisted?
    end
  end


end
