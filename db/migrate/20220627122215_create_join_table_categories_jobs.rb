class CreateJoinTableCategoriesJobs < ActiveRecord::Migration[7.0]
  def change
    create_join_table :Categories, :Jobs do |t|
      t.index [:category_id, :job_id]
      t.index [:job_id, :category_id]
    end
  end
end
