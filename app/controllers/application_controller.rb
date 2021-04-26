class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password, :password_confirmation, :nickname, :last_name, :first_name, :last_name_read, :first_name_read, :born])
  end
end
