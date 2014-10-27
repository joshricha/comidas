class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  # method to add the recipe to the users meal plan
  def add

    if logged_in?

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