
class ChangeBidStatus < ActiveRecord::Migration[7.0]
  def change

   change_column :bids, :status, :integer, default:0
  end
end
