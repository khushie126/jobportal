class ProfileInformationsController < ApplicationController
  before_action :authenticate_user!  

  def index
    @pi = ProfileInformation.all
    @profile_informations = ProfileInformation.includes(:experiences).all
    @profile_information_skills = {} 
    @pi.each do |profile_information|
    @job_skills[job_post.id] =job_post.skills.pluck(:name)
    @applied_status[job_post.id] = AppliedJob.exists?(user_id: current_user.id, job_post_id: job_post.id)
    end
  end

  def show
    @pi = ProfileInformation.find(params[:id])
    @skills = @pi.skills.pluck(:name)
    if @pi.nil?
      flash[:alert] = "Profile information not found."
      redirect_to new_profile_information_path
    end
  end

  def new
    @pi = current_user.build_profile_information
    @pi.educations.build
    @pi.experiences.build
    @pi.projects.build
    @skills = Skill.all # List all available skills
    @pi.skill_assignments.build
  end

  def create
    @pi = current_user.build_profile_information(profile_information_params)
    if @pi.save
      redirect_to @pi, notice: 'Profile Information was successfully created.'
    else
      render :new
    end
  end

  def edit
    @pi = ProfileInformation.find(params[:id])
    @skills = Skill.all # List all available skills
    @pi.skill_assignments.build
  end

  def update
    @pi = ProfileInformation.find(params[:id])
    if @pi.update(profile_information_params)
      redirect_to @pi, notice: 'Profile Information was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def profile_information_params
    params.require(:profile_information).permit(
      :firstname, :lastname, :phone_number, :profile_image, :company_id,
      experiences_attributes: [:id, :start_date, :end_date, :company_name, :description, :_destroy],
      educations_attributes: [:id, :start_date, :end_date, :school_name, :college_name, :score_type, :score, :_destroy],
      project_attributes: [:id, :title, :description, :_destroy], skill_assignments_attributes: [:skill_id, :level, :_detsroy]
    )
  end

end