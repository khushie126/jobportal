class SkillAssignment < ApplicationRecord
  belongs_to :skill, dependent: :destroy
  belongs_to :skillable, polymorphic: true, dependent: :destroy

  enum :level, [ :beginner, :intermediate, :expert ]
  validates :skill_id, uniqueness: { scope: [:skillable_type, :skillable_id], message: "has already been added" }
end

