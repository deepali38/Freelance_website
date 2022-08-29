class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :require_user_logged_in!, :set_current_user

  before_action :set_current_user
  before_action :set_notifications, if: :set_current_user

  private

  def set_notifications
    notification= Notification.where(recipient: Current.user).newest_first.limit(9)
    @unread =notification.unread
    @read =notification.read
  end
end
