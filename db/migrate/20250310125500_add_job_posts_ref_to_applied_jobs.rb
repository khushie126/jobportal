class AddJobPostsRefToAppliedJobs < ActiveRecord::Migration[7.1]
  def change
    add_reference :applied_jobs, :job_post, null: false, foreign_key: true
  end
end
