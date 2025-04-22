class ProfileInformationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pi = ProfileInformation.all
    @profile_informations = ProfileInformation.includes(:experiences).all
    @profile_information_skills = {}
    @pi.each do |profile_information|
    @profile_information_skills[profile_information.id] = profile_information.skills.pluck(:name)
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
      redirect_to profile_informations_path, notice: "Profile Information was successfully created."
    else
      render :new,  status: :unprocessable_entity
    end
  end

  def edit
    @pi = ProfileInformation.find(params[:id])
    @pi.skill_assignments.build if @pi.skill_assignments.empty?
  end

    def update
      @pi = ProfileInformation.find(params[:id])
      @skills = @pi.skills.pluck(:name)

      if @pi.update(profile_information_params)
        # If update is successful, redirect to the profile page
        redirect_to @pi, notice: "Profile updated successfully."
      else
        # If update fails, render the edit page with errors
        render :edit
      end
    end
  private
  def profile_information_params
    params.require(:profile_information).permit(
      :firstname, :lastname, :phone_number, :profile_image, :company_id,
      experiences_attributes: [ :id, :start_date, :end_date, :company_name, :description, :_destroy ],
      educations_attributes: [ :id, :start_date, :end_date, :school_name, :college_name, :score_type, :score, :_destroy ],
      project_attributes: [ :id, :title, :description, :_destroy ], skill_assignments_attributes: [ :id, :skill_id, :level, :_destroy ]
    )
  end
end
