class Job < ApplicationRecord
    belongs_to :user
    has_many :bids, dependent: :destroy
    accepts_nested_attributes_for :bids
    mount_uploader :avatar, AvatarUploader 
    validates :category_id, presence: true
    belongs_to :category, dependent: :destroy
    validates :description, presence: true, length: {minimum:225}
    has_noticed_notifications model_name: 'Notification'
    has_many :notifications, through: :user, dependent: :destroy
    def self.search(search)
        where("category_id LIKE?", "%#{search}")
    end
end
