class Education < ApplicationRecord
  belongs_to :profile_information, optional: true
end
