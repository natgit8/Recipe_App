class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  has_attached_file :image, styles: { medium: "300x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def ingredients_attributes=(ingredients_attributes)
    if !attributes["0"].values.include?("")
       attributes.values.each do |key|
         self.ingredients << Ingredient.find_or_create_by(key)
       end
     end
   end

   
end
