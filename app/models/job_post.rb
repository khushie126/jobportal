class JobPost < ApplicationRecord
  has_many :applied_jobs
  belongs_to :company
  has_many :skill_assignments, as: :skillable
  has_many :skills, through: :skill_assignments
 
  belongs_to :creator, class_name: "User", foreign_key: "created_by"
  validates :title, presence:true, on: :create
  accepts_nested_attributes_for :skill_assignments, allow_destroy: true
  def applied_count
    self.applied_jobs.count
  end
end
