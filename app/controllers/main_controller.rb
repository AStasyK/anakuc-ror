class MainController < ApplicationController
  skip_before_action :ensure_login
  def index
  end

  def help
  end

  def about
  end

  def contacts
  end
end
