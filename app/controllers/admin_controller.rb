class AdminController < ApplicationController
    before_action :authenticate_with_http_digest

    def index 
        @user=User.where(approved: false)
    end

    def accept
        @user=User.find(params[:admin_id])
        if params[:action]=="accept"
          @user.update(approved: true)
          redirect_to admin_path, notice: 'User registration is approved'
         else
         redirect_to admin_path, notice: 'User registration is Not approved'
        end
    end
end