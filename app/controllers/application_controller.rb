class ApplicationController < ActionController::Base
  #{  "protect_from_forgery with: :exception\n" if Rails.version < "5.2"}
  before_action :authenticate_user!
end
