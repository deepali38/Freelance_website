class CreateUploadFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :upload_files do |t|

      t.timestamps
    end
  end
end
