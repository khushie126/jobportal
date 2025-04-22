class RemoveColumnCountFromAppliedJobs < ActiveRecord::Migration[7.1]
  def change
    remove_column :applied_jobs, :count
    add_column :job_posts, :count, :integer
  end
end
