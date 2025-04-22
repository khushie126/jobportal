class ProfileInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_image
  belongs_to :company, optional: true
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :skill_assignments, as: :skillable, dependent: :destroy
  has_many :skills, through: :skill_assignments , dependent: :destroy
  accepts_nested_attributes_for :educations
  accepts_nested_attributes_for :experiences
  accepts_nested_attributes_for :skill_assignments, allow_destroy: true
  validates :firstname,:lastname,:phone_number, presence:true,  on: :create
  private

  # Custom validation to check for duplicate skills
  def no_duplicate_skills
    skill_ids = skill_assignments.map(&:skill_id)
    if skill_ids.uniq.length != skill_ids.length
      errors.add(:base, "You have selected duplicate skills.")
    end
  end

end
