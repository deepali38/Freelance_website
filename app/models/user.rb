# frozen_string_literal: true

class User < ApplicationRecord
  # Attributes on registration
  has_one_attached :avatar, dependent: :destroy
  has_secure_password
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be valid email id' }
  enum role: %i[freelance client]

  # Profile
  has_one :profile, dependent: :destroy

  # jobs
  has_many :jobs, dependent: :destroy

  # bids
  has_many :bids, dependent: :destroy

  #notifications
  has_many :notifications, as: :recipient, dependent: :destroy

  # messages
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }
  has_many :messages

  # some default value
  after_initialize(:set_default_role, { if: :new_record? })

  def set_default_role
    self.role ||= :freelance
  end

  # default pic of user
  after_commit :add_default_avatar, on: %i[create]

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'default_profile.png')),
      filename: 'default_profile.png',
      content_type: 'image/png'
    )
  end

  # for seeds
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end
end
