class Education < ApplicationRecord
  belongs_to :profile_information, optional: true
  
  enum :score_type, [:percentage, :gpa, :grade]

  validate :end_date_after_start_date
  validate :score_format_by_type
  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
  def score_format_by_type
    return if score.blank?
  
    case score_type
    when "gpa"
      unless score.match?(/\A\d(\.\d{1,2})?\z/) && score.to_f.between?(0.0, 10.0)
        errors.add(:score, "must be a GPA between 0.0 and 10.0")
      end
  
    when "percentage"
      unless score.match?(/\A\d{1,3}(\.\d{1,2})?\z/) && score.to_f.between?(0.0, 100.0)
        errors.add(:score, "must be a percentage between 0 and 100")
      end
  
    when "grade"
      valid_grades = %w[A+ A A- B+ B B- C+ C C- D F]
      unless valid_grades.include?(score.upcase)
        errors.add(:score, "must be a valid grade (e.g., A+, B, C-)")
      end
    end
  end

  
end
