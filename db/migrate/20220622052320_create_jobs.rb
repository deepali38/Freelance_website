# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :job_author
      t.string :apply_url

      t.timestamps
    end
  end
end
