class ProfileInformationSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :profile_information, optional: true
end
