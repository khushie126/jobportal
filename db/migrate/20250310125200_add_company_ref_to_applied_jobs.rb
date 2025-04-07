class AddCompanyRefToAppliedJobs < ActiveRecord::Migration[7.1]
  def change
    add_reference :applied_jobs, :company, null: false, foreign_key: true
  end
end
