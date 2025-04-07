class JobPost < ApplicationRecord
  has_many :job_post_skills
  has_many :skills, through: :job_post_skills
  has_many :applied_jobs
  belongs_to :company

  def applied_count
    self.applied_jobs.count
  end
end
