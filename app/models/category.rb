class Category < ApplicationRecord
    has_many :categories_jobs
    has_many :jobs, through: :categories_jobs
end
