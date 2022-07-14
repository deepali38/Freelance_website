class RemoveUserIdFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :User_id, :integer
  end
end
