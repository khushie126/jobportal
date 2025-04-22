class AddUserRefToAppliedJobs < ActiveRecord::Migration[7.1]
  def change
    add_reference :applied_jobs, :user, null: false, foreign_key: true
  end
end
