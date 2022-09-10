# frozen_string_literal: true

class AddCategoryIdToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :category_id, :integer
  end
end
