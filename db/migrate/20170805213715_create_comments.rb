class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :recipe
      t.references :user
      t.integer :rating
      t.string :body
      t.timestamps
    end
  end
end
