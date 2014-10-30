class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # helper for Google+ login
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  # old logins, don't delete yet

  # private

  # def current_user
  #   User.find_by(id: session[:user_id])
  # end
  # helper_method :current_user

  # def logged_in?
  #   !!current_user
  #   # if current_user.present?
  #   #   true
  #   # else
  #   #   false
  #   # end
  # end
  # helper_method :logged_in?

  # def authenticate
  #   redirect_to login_path unless logged_in?

  #   # @current_user = User.find_by(:id => session[:user_id])
  #   # session[:user_id] = nil unless @current_user.present?

  #   # if @current_user.present?
  #   # else
  #   #   session[:user_id] = nil
  #   # end
  # end

end
