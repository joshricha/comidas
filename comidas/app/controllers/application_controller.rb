class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  private

  def current_user
    User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def logged_in?
    !!current_user
    # if current_user.present?
    #   true
    # else
    #   false
    # end
  end
  helper_method :logged_in?

  def authenticate
    redirect_to login_path unless logged_in?

    # @current_user = User.find_by(:id => session[:user_id])
    # session[:user_id] = nil unless @current_user.present?

    # if @current_user.present?
    # else
    #   session[:user_id] = nil
    # end
  end

end
