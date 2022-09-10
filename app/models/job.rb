# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy
  accepts_nested_attributes_for :bids
  mount_uploader :avatar, Uploader::AvatarUploader
  validates :category_id, presence: true
  belongs_to :category, dependent: :destroy
  validates :description, presence: true, length: { minimum: 225 }
  validates :location, presence: true
  validates :job_author, presence: true
  validates :title, presence: true
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :user, dependent: :destroy
  
  def search(search)
    where('category_id LIKE?', "%#{search}")
  end
end
