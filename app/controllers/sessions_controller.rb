class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  def new
  end

  def create
    unless params[:session].blank?
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # Sign the user in and redirect to the user's show page.
        log_in user
        redirect_to root_path, notice: 'Logged in successfully'
      else
        # Create an error message and re-render the signin form.
        redirect_to login_path, alert: 'Login failed. Invalid email/password combination. Repeat'
      end
    end
  end

  def destroy
    reset_session
    log_out
    redirect_to root_path, notice: 'You have been logged out'
  end
end
