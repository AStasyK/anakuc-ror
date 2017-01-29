class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #add Sessions module
  include SessionsHelper
  before_action :ensure_login
  before_action :set_locale

  def extr_locale_in_accept_lang
    locale = params[:locale]#.scan(/^[a-z]{2}/).first
    logger.info "In extr_locale_in_accept_lang: locale = #{locale}"
  end

  protected
  def ensure_login
    redirect_to login_path unless cookies[:remember_token]
  end

  private
  def set_locale_from_params
    if params[:locale]
      extr_locale_in_accept_lang
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
        logger.info flash.now[:notice]
      else
        flash.now[:alarm] = " #{params[:locale]} Translation not found"
        logger.error flash.now[:alarm]
      end
      params[:locale]
    end
  end
  # end

  def set_locale
    I18n.locale = set_locale_from_params || I18n.default_locale
    Rails.application.routes.default_url_options[:locale]= I18n.locale
  end
end
