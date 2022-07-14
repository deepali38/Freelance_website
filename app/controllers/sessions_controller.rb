class SessionsController < ApplicationController
    def new;
    end

    def create
      user = User.find_by(email: params[:email])
      # finds existing user, checks to see if user can be authenticated
      if user.present? && user.client? && user.authenticate(params[:password])
        
      # sets up user.id sessions
        session[:user_id] = user.id
        redirect_to jobs_path, notice: 'Logged in successfully'

      elsif user.present? && user.freelance? && user.authenticate(params[:password])
        
        # sets up user.id sessions
          session[:user_id] = user.id
          redirect_to root_path, notice: 'Logged in successfully'
      else
        redirect_to sign_in_path, alert: 'Invalid Credentials'
      end
    end

    def destroy
      # deletes user session
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end

    def show
    end
end