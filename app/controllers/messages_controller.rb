# frozen_string_literal: true

class MessagesController < ApplicationController

  def create
    @current_user = Current.user
    @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append(:messages,
          locals: { message: message })
      end
      format.html {redirect_back(fallback_location: @message.room)}
    end
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end
end
