class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #add Sessions module
  include SessionsHelper
  before_action :ensure_login

  protected
  def ensure_login
    redirect_to login_path unless cookies[:remember_token]
  end
end
