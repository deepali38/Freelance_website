class Job < ApplicationRecord
    belongs_to :user
    mount_uploader :avatar, AvatarUploader
    has_many :categories_jobs
    has_many :categories, through: :categories_jobs

end
