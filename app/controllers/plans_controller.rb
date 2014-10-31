class PlansController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @plans = Plan.where(user_id: current_user.id)
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    redirect_to '/'
  end

end