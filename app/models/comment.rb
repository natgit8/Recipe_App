class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :user, presence:true
  validates :recipe, presence:true
  validates :body, presence: true

  validates_inclusion_of :rating, :in => 1..5, message: "is between 1-5"



end
