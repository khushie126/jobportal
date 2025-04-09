class Skill < ApplicationRecord
  has_many :skill_assignments
  has_many :profile_informations, through: :skill_assignments, source: :skillable, source_type: 'ProfileInformation'
  has_many :job_posts, through: :skill_assignments, source: :skillable, source_type: 'JobPost'
end

