class Review < ApplicationRecord
  belongs_to :company
  belongs_to :user
  validates :point, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true
  enum :category, [ :Job_Security, :Work_Life_Balance, :Company_Culture, :Skill_development ] , presence: true
  validate :unique_category_per_user_for_company
  private

  def unique_category_per_user_for_company
    if Review.exists?(user_id: user_id, company_id: company_id, category: category)
      errors.add(:category, "has already been reviewed by you for this company")
    end
  end
end
