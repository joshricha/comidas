class PlansController < ApplicationController

  def index
    @plans = Plan.where(user_id: current_user.id)
  end

end