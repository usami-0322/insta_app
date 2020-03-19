class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  # before_action :set_host
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  # def set_host
  #   Rails.application.routes.default_url_option[:host] = request.host_with_port
  # end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :username, :url, :phone, :introduce, :sex])
  end
end
