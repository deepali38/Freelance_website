class RegistrationEditController < ApplicationController 
  before_action :require_user_logged_in!

  def edit 
  end 

  def update 
    if Current.user.update(user_params)
      redirect_to root_path, notice: 'User Credentials Updated'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name_or_company_name, :password, :password_confirmation)
  end
end