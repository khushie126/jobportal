class Company < ApplicationRecord
  has_one_attached :company_logo
  has_many :job_posts
  has_many :profile_informations
  has_many :applied_jobs 
  has_many :reviews
  accepts_nested_attributes_for :reviews, allow_destroy: true

  # app/models/company.rb
validates :review, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true
validates :company_name , presence: true ,on: :create
end
