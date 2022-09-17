# frozen_string_literal: true

class PasswordsController < ApplicationController
  # allows only logged in users
  before_action :require_user_logged_in!, only: %i[edit update]

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      # send mail
      PasswordMailer.with(user: @user).reset.deliver_later
      # deliver_later is provided by ActiveJob
    end
    redirect_to root_path, notice: 'Please check your email to reset the password'
  end

  def edit; end

  def update
    # update user password
    if Current.user.update(password_params)
      redirect_to root_path, notice: 'Password Updated'
    else
      render :edit, alert: "Password not updated"
    end
  end

  def reset_edit
    # finds user with a valid token
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Your token has expired. Please try again.'
  end

  def reset_update
    # updates user's password
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'Your password was reset successfully. Please sign in'
    else
      render :reset_edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
