class ShoppingListsController < ApplicationController

  def index
    # @plans = Plan.where(user_id: current_user.id)

    @ingredients = current_user.plans.joins(:recipe => :ingredients)

    sql = "select sum(a.grams), i.name from plans p join recipes r on (p.recipe_id=r.id) join amounts a on (a.recipe_id=r.id) join ingredients i on (a.ingredient_id=i.id) where p.user_id = #{current_user.id} group by i.name, a.ingredient_id order by a.ingredient_id;"
    @plans = ActiveRecord::Base.connection.execute(sql)
    # raise 'err'
  end

  def new

  end

end