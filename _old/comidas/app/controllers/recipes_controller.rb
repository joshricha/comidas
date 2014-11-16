class RecipesController < ApplicationController

  def index

    if params[:meal_type] == "breakfast"
      @recipes = Recipe.where(meal_type: "Breakfast")
    elsif params[:meal_type] == "lunch"
      @recipes = Recipe.where(meal_type: "Lunch")
    elsif params[:meal_type] == "dinner"
      @recipes = Recipe.where(meal_type: "Dinner")
    else
      @recipes = Recipe.all
    end
  end

  # method to add the recipe to the users meal plan
  def add

    if user_signed_in?

      # finds the recipe which has been clicked to be added
      recipe = Recipe.find(params[:id])

      # created a plan and adds the currents users id and recipe_id
      plan = Plan.create(user_id: current_user.id, recipe_id: recipe.id)

      plan.save
      redirect_to '/'

    else
      authenticate
    end
  end

end