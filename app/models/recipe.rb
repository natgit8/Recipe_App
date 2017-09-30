class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :comments
  has_many :favorites, dependent: :destroy


  validates_presence_of :ingredients, :unless => lambda { self.ingredients.blank? }


  scope :most_recent, -> { order(created_at: :desc)}
  scope :created_within, ->(time, occurred_at) { where("created_at > ? AND created_at < ?", time, occurred_at) }



  has_attached_file :image, styles: { :thumb => '100x100!#', :medium => '450x300!>'}, :default_url => ActionController::Base.helpers.image_path("defimage.jpg")

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |k, attribute|
      ingredient = Ingredient.find_or_create_by(attribute)
      ingredients << ingredient if ingredient.persisted?
    end
  end


  def next
    recipe = Recipe.where("id > ?", id).first

    if recipe
      recipe
    else
      Recipe.first
    end

  end

end
