class AddDescriptionToUploadFiles < ActiveRecord::Migration[7.0]
  def change
    add_column :upload_files, :description, :string, null: false
  end
end
