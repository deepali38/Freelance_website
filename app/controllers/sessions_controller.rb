class SessionsController < ApplicationController

  #new
  def new;
  end

  # sign-in/log-in
  def create
    user = User.find_by(email: params[:email])
    # finds existing user, checks to see if user can be authenticated
    if user.present? && user.authenticate(params[:password]) && user.approved?
      
      # sets up user.id sessions
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      redirect_to sign_in_path, alert: 'Invalid Credentials'
    end
  end

  # log-out
  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end

end