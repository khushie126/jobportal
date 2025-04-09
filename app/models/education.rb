class Education < ApplicationRecord
  belongs_to :profile_information, optional: true
  
  enum :score_type, [:percentage, :gpa, :marks]
end
