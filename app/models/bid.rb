# frozen_string_literal: true

class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_one_attached :document, dependent: :destroy
  validates :user_id, uniqueness: { scope: :job_id }
  enum status: %i[Pending Accepted Rejected]
  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'
  
  has_many :notifications, through: :user, dependent: :destroy

<<<<<<< HEAD
=======
  #upload
  has_one :upload_file, dependent: :destroy
  
>>>>>>> cd1bc9ccdb085d49f2728aa758cd9da3897e9ce4
  private

  def notify_recipient
    BidNotification.with(bid: self,job: job).deliver_later(job.user)
  end

  def cleanup_notifications
    notifications_as_bid.destroy_all
  end
end
