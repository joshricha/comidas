class CreateJoinTablePlansRecipes < ActiveRecord::Migration
  def change
    create_join_table :plans, :recipes do |t|
      # t.index [:plan_id, :recipe_id]
      # t.index [:recipe_id, :plan_id]
    end
  end
end
