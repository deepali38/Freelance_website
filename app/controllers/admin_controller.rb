# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_with_http_digest
  before_action :require_user_logged_in!
  before_action :admin

  def index
    @user = User.where(approved: false)
    @categories = Category.all
  end

  def accept
    @user = User.find(params[:admin_id])
    if params[:action] == 'accept'
      @user.update(approved: true)
      redirect_to admin_index_path, notice: 'User registration is approved'
    else
      redirect_to admin_index_path, alert: 'User registration is Not approved'
    end
  end

  private

  def admin
    redirect_to root_path, alert: 'You are Not an admin' unless Current.user.isadmin?
  end
end
