class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    attributes1 = [:first_name, :last_name, :email, :password, :password_confirmation, :username, :profile_picture]
    devise_parameter_sanitizer.permit(:account_update, keys: attributes1)
    attributes2 = [:first_name, :last_name, :email, :password, :password_confirmation, :username]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes2)
  end
end
