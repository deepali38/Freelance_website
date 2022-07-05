class User < ApplicationRecord
    has_one_attached :avatar
    has_secure_password
    has_many :messages
    
    validates :email, presence: true ,uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be valid email id" }
    enum role:[:freelance, :admin, :client]

    after_initialize( :set_default_role, {if: :new_record?})

    def set_default_role
        self.role ||=:freelance
    end
    
    has_many :jobs, dependent: :destroy
    scope :all_except, ->(user) { where.not(id: user) }
    after_create_commit {broadcast_append_to "users"}
end

