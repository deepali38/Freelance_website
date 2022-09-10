# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name_or_company_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :education, null: false
      t.string :experience, null: false
      t.string :industry, null: false
      t.integer :role, default: 0, null: false
      t.blob :avatar
      t.timestamps
    end
  end
end
