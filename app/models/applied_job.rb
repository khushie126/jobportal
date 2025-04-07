class AppliedJob < ApplicationRecord
  belongs_to :company
  belongs_to :job_post
  belongs_to :user
  enum :status, [:applied, :interview, :accepted, :rejected]

validates :status, presence: true
end