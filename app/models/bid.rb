class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :user 
  validates :user_id, uniqueness: { scope: :job_id}
  enum status:[:Pending, :Accepted, :Rejected]

  #Notifications
  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy
  
  private

  def notify_recipient
    BidNotification.with(bid: self, job: job).deliver_later(job.user)
  end

  def cleanup_notifications
    notifications_as_bid.destroy_all
  end
end
