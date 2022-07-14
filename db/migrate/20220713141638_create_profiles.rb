class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :description
      t.boolean :is_private, default:false

      t.timestamps
    end
  end
end
