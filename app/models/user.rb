class User < ApplicationRecord
    has_one_attached :avatar, dependent: :destroy
    has_secure_password
    has_many :messages
    has_one :profile, dependent: :destroy
    before_create :build_profile
    accepts_nested_attributes_for :profile
    validates :email, presence: true ,uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be valid email id" }
    enum role:[:freelance, :admin, :client]

    after_initialize( :set_default_role, {if: :new_record?})

    def set_default_role
        self.role ||=:freelance
    end
    
    has_many :jobs, dependent: :destroy
    scope :all_except, ->(user) { where.not(id: user) }
    after_create_commit {broadcast_append_to "users"}
    after_commit :add_default_avatar, on: %i[create]

    def chat_avatar 
        avatar.variant(resize_to_limit:[50,50]).processed
    end

    def avatar_thumbnail
        avatar.variant(resize_to_limit: [150, 150]).processed
    end

    private

    def add_default_avatar
        return if avatar.attached?
    
        avatar.attach(
          io: File.open(Rails.root.join('app', 'assets', 'images', 'default_profile.png')),
          filename: 'default_profile.png',
          content_type: 'image/png'
        )
    end

end

