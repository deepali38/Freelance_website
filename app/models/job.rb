class Job < ApplicationRecord
    belongs_to :user
    mount_uploader :avatar, AvatarUploader
    validates :category_id, presence: true
    belongs_to :category
    validates :description, presence: true, length: {minimum:225}

    def self.search(search)
        where("category_id LIKE?", "%#{search}")
    end
end
