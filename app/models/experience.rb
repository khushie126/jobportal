class Experience < ApplicationRecord
  belongs_to :profile_information, optional: true

  validate :end_date_after_start_date
  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
