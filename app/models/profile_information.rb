class ProfileInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image
  belongs_to :company, optional: true
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :profile_information_skills, dependent: :destroy
  has_many :skills, through: :profile_information_skills

  accepts_nested_attributes_for :educations
  accepts_nested_attributes_for :experiences
end