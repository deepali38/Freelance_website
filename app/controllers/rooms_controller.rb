class RoomsController < ApplicationController
  before_action :authenticate_with_http_digest
  def index
    @current_user = Current.user
    redirect_to 'sign_in_path' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
  end

  def create
    @room = Room.create(name: params["room"]["name"])
    redirect_to @room
  end

  def show
    @current_user = Current.user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages
    render 'index'
  end

end
