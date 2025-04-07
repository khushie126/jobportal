class Skill < ApplicationRecord
  has_many :job_post_skills
  has_many :profile_information_skills, dependent: :destroy
  has_many :profile_informations, through: :profile_information_skills
  has_many :job_posts, through: :job_post_skills
end
