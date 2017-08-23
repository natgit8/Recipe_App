class Favorite < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :user_id, uniqueness: { scope: :recipe_id, message: "You can only like a post once" }




end
