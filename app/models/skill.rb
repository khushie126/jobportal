class Skill < ApplicationRecord
  has_many :skill_assignments, dependent: :destroy
  has_many :profile_informations, through: :skill_assignments, source: :skillable, source_type: 'ProfileInformation',dependent: :destroy
  has_many :job_posts, through: :skill_assignments, source: :skillable, source_type: 'JobPost'
end

