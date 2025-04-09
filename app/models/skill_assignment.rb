class SkillAssignment < ApplicationRecord
  belongs_to :skill
  belongs_to :skillable, polymorphic: true

  enum level: { beginner: 0, intermediate: 1, expert: 2 }
end

