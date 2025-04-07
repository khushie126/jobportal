class Project < ApplicationRecord
  belongs_to :profile_information, optional: true
end
