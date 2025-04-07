class Company < ApplicationRecord
  has_one_attached :company_logo
  has_many :job_posts
  has_many :profile_informations
  has_many :applied_jobs 
end
