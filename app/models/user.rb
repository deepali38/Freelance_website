class User < ApplicationRecord
    has_one_attached :avatar
    has_secure_password
    
    validates :email, presence: true ,uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be valid email id" }
    enum role:[:freelance, :admin, :client]

    after_initialize( :set_default_role, {if: :new_record?})

    def set_default_role
        self.role ||=:user
    end
    def admin?
        role=="admin"
    end
    def client?
        role=="client"
    end
    def freelance?
        role=="freelance"
    end
end

