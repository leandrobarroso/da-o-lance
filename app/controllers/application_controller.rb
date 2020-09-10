class ApplicationController < ActionController::Base
  # {  "protect_from_forgery with: :exception\n" if Rails.version < "5.2"}
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  # skip_before_action :set_locale, only: [:set_locale_en, :set_locale_pt]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :address, :photo])
  end

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def set_locale_en
    params["locale"] = "en"
    # cookies.permanent[:da_o_lance_locale] = "en"
    # redirect_to request.referer || root_url
  end

  def set_locale_pt
    params["locale"] = "pt"
    # cookies.permanent[:da_o_lance_locale] = "pt"
    # redirect_to request.referer || root_url
  end

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
