class AddColumnsToUploadFile < ActiveRecord::Migration[7.0]
  def change
    add_column :upload_files, :user_id, :integer, null: false
    add_column :upload_files, :job_id, :integer, null: false
    add_column :upload_files, :bid_id, :integer, null: false
  end
end
