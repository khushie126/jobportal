class JobPostSkill < ApplicationRecord
  belongs_to :job_post 
  belongs_to :skill
  enum :level,[:beginner, :intermediate, :expert]
  validates :job_post_id, uniqueness: { scope: :skill_id, message: "Skill already added to this job post" }
end
