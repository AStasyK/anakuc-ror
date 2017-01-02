module SessionsHelper
  #log in
  def log_in user
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end
  #setter
  def current_user=(user)
    @current_user = user
  end
  #helper methods
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by_remember_token(remember_token)
  end

  def logged_in?
    !current_user.nil?
  end
  #log out
  def log_out
    unless current_user.blank?
      new_token = User.new_remember_token
      current_user.update_attribute(:remember_token, User.encrypt(new_token))
      cookies.delete(:remember_token)
      self.current_user = nil
    end
  end
end
