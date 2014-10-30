class CreateAmounts < ActiveRecord::Migration
  def change
    create_table :amounts do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.integer :grams

      t.timestamps
    end
  end
end
