class ProfileInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image
  belongs_to :company, optional: true
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :skill_assignments, as: :skillable
  has_many :skills, through: :skill_assignments
  accepts_nested_attributes_for :educations
  accepts_nested_attributes_for :experiences
  accepts_nested_attributes_for :skill_assignments, allow_destroy: true
end