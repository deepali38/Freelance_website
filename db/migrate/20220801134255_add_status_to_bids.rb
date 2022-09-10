# frozen_string_literal: true

class AddStatusToBids < ActiveRecord::Migration[7.0]
  def change
    add_column :bids, :status, :integer, null: false, default: 0
  end
end
