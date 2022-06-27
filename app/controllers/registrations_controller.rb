class RegistrationsController < ApplicationController 
    def new
        @user = User.new
    end
    def create
    @user = User.new(user_params)
    if @user.save 
      if @user.client?
        WelcomeMailer.with(user: @user).welcome_email.deliver_now
      # deliver_now is provided by ActiveJob.
        session[:user_id] = @user.id
        redirect_to new_job_path, notice: 'Successfully created account'
      else
        WelcomeMailer.with(user: @user).welcome_email.deliver_now
        # deliver_now is provided by ActiveJob.
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Successfully created account'
      end

    else
      render :new
    end
    end
    private
    def user_params
        # strong parameters
        params.require(:user).permit(:avatar, :name_or_company_name, :email, :education, :experience, :industry, :password, :password_confirmation, :role)
    end
end
