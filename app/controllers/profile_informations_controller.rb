class ProfileInformationsController < ApplicationController
  
    before_action :authenticate_user!  
    
    def index
      @pi = ProfileInformation.all
      @profile_informations = ProfileInformation.includes(:experiences).all
      @pi = ProfileInformation.includes(:skills).all
    end
    def show
      @pi = ProfileInformation.find(params[:id])
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
      @skills = Skill.all
    end
    def create
      @pi = current_user.build_profile_information(profile_information_params)
    
      if @pi.save
       
        random_skills = Skill.all.sample(rand(1..8)) 
        random_skills.each do |skill|
          unless ProfileInformationSkill.exists?(profile_information_id: @pi.id, skill_id: skill.id)
            ProfileInformationSkill.create(profile_information_id: @pi.id, skill_id: skill.id)
          end
        end
            redirect_to @pi, notice: 'Profile Information was successfully created.'
      else
              render :new
      end
    end
    
    

    def edit
      @pi = ProfileInformation.find(params[:id])
      @skills = Skill.all
    end
  
    def update
      @pi = ProfileInformation.find(params[:id])
      if @pi.update(profile_information_params)
        redirect_to @pi
      else
        render :edit, status: :unprocessable_entity
      end
    end
 
    private

    def profile_information_params
      params.require(:profile_information).permit(:firstname, :lastname, :phone_number, :profile_image, :company_id, experiences_attributes: [:id, :start_date, :end_date, :company_name, :description, :_destroy], education_attributes:[:id, :start_date, :end_date, :school_name, :college_name, :score_type, :score], project_attributes:[:id, :title, :description],skill_ids: [] )
    end
end
