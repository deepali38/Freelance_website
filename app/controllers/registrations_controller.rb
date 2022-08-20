class RegistrationsController < ApplicationController 

  # new
  def new
      @user = User.new
  end

  # create
  def create
    @user = User.new(user_params)
    if @user.save 
      WelcomeMailer.with(user: @user).welcome_email.deliver_now
      # deliver_now is provided by ActiveJob.
      session[:user_id] = @user.id
      redirect_to notices_path, notice: 'Successfully created account'
    else
      redirect_to sign_up_path, alert: "Unsuccessfull. Fill the credentials correctly."
    end
  end

  private

  def user_params
    # strong parameters
    params.require(:user).permit(:avatar, :name_or_company_name, :email, :education, :experience, :industry, :password, :password_confirmation, :role)
  end
end
