class CategoriesJob < ApplicationRecord
    belongs_to :category
    belongs_to :job
end
