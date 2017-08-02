class AddDirectionsToRecipe < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :directions, :text
  end
end
