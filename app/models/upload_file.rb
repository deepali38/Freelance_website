class UploadFile < ApplicationRecord
  belongs_to :user
  belongs_to :bid
  validates :description, presence: true
  # validates :user_id, uniqueness: { scope: :bid_id, message: "Already uploaded"}
  has_many_attached :files, dependent: :destroy
end
