class CreateAppliedJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :applied_jobs do |t|
      t.integer :status
      t.integer :count

      t.timestamps
    end
  end
end
