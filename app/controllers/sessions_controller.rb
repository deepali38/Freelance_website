class SessionsController < ApplicationController

  #new
  def new;
  end

  # sign-in/log-in
  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password]) && user.approved?
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      redirect_to sign_in_path, alert: 'Invalid Credentials'
    end
  end

  # log-out
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out'
  end

end