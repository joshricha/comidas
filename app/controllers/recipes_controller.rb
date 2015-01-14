class RecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    case params[:meal_type]
      when "breakfast"
        @recipes = Recipe.where(meal_type: "Breakfast")
      when "lunch"
        @recipes = Recipe.where(meal_type: "Lunch")
      when "dinner"
        @recipes = Recipe.where(meal_type: "Dinner")
      else
        @recipes = Recipe.all
    end
  end

  # method to add the recipe to the users meal plan
  def add
    if user_signed_in?
      recipe = Recipe.find(params[:id])
      plan = Plan.create(user_id: current_user.id, recipe_id: recipe.id)

      redirect_to '/'
    else
      redirect_to new_user_registration_path
    end
  end

end