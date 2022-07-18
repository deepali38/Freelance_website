class Profile < ApplicationRecord
    belongs_to :user
    has_many_attached :files, dependent: :destroy
    validates :category_id, presence: true
    belongs_to :category

    def self.search(search)
        where("category_id LIKE?", "%#{search}")
    end
end
