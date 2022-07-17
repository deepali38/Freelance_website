class Job < ApplicationRecord
    belongs_to :user
    mount_uploader :avatar, AvatarUploader
    validates :category_id, presence: true
    belongs_to :category

end
