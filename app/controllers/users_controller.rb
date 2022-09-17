# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_user_logged_in!, only: %i[show edit update]
  before_action :check_user, only: %i[show]

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      WelcomeMailer.with(user: @user).welcome_email.deliver_now
      session[:user_id] = @user.id
      redirect_to notices_path, notice: 'Successfully created account'
    else
      redirect_to sign_up_path, alert: 'Unsuccessfull. Fill the credentials correctly.'
    end
  end

  def update
    if Current.user.update(user_params)
      redirect_to root_path, notice: 'User Credentials Updated'
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @current_user = Current.user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages
    render 'rooms/index'
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name_or_company_name, :email, :education, :experience, :industry, :password,
                                 :password_confirmation, :role)
  end

  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end

  def check_user
    redirect_to root_path, alert: 'User does not exists' unless User.exists?(params[:id])
  end
end
