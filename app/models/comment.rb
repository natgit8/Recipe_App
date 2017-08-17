class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates_uniqueness_of :body, :rating, :scope => :user
  validates_inclusion_of :rating, :in => 1..5, message: "is between 1-5"


  
end
