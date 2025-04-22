class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile_information, dependent: :destroy
  has_many :experiences, through: :profile_information
  has_many :educations, through: :profile_information
  has_many :projects, through: :profile_information
  has_many :applied_jobs
  has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, [:job_seeker, :recruiter, :admin]
         after_initialize :set_default_role, if: :new_record?
         
  # def full_name
  #   self.profile_information.firstname + " " + self.profile_information.lastname
  # end

  private

  def set_default_role
    self.role ||= :job_seeker
  end
end
