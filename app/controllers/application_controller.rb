class ApplicationController < ActionController::Base
  #{  "protect_from_forgery with: :exception\n" if Rails.version < "5.2"}
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :address, :photo])
  end
end
