class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :user 
  validates :user_id, uniqueness: { scope: :job_id}

  enum status:[:Pending, :Accepted, :Rejected]
  
end
