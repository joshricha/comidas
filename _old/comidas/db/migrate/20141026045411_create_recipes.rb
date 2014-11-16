class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cuisine
      t.string :meal_type
      t.integer :calories
      t.string :image_url

      t.timestamps
    end
  end
end
