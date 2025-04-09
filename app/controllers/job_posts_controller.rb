class JobPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role , only: [:edit, :update, :create, :new]
  def index
    @jp = JobPost.all
    @applied_status = {}
    @job_skills = {} 
    @jp.each do |job_post|
    @job_skills[job_post.id] =job_post.skills.pluck(:name)
    @applied_status[job_post.id] = AppliedJob.exists?(user_id: current_user.id, job_post_id: job_post.id)
    end
  end
  

  def new
    @jp = JobPost.new
    @jp.skill_assignments.build
  end

  def show
    @jp = JobPost.find_by(id: params[:id])
    @skills = @jp.skills.pluck(:name)
    @applied_job = AppliedJob.find_by(user_id: current_user.id, job_post_id: @jp.id) if current_user
    if @jp.nil?
      flash[:alert] = "JobPost not found."
      redirect_to new_job_post_path
    end

  end
  

  
  def create
    @jp = JobPost.new(job_post_params)
    if AppliedJob.exists?(user_id: current_user.id, job_post_id: @jp.id)
      redirect_to @jp, alert: 'You have already applied for this job.'
     else
      @applied_job = AppliedJob.new(user_id: current_user.id, job_post_id: @jp.id, status: :applied)
     end
      if @applied_job.save
        redirect_to @jp, notice: 'You have successfully applied for the job.'
      else
        redirect_to @jp, alert: 'There was an error with your application.'
      end
   
    if @jp.save
      redirect_to @jp, notice: 'Job post was successfully created.'
    end
  end
  
  def edit
    @jp = JobPost.find(params[:id])
    @jp.skill_assignments.build
  end

  def update
    @jp = JobPost.find(params[:id])
    if @jp.update(job_post_params)
      redirect_to @jp
    else
      render :edit, status: :unprocessable_entity
    end
  end

 
  private
  def check_role
    unless current_user.admin? || current_user.recruiter?
      redirect_to root_path, alert: "You do not have permission to access this page." 
    end
  end
  def job_post_params
    params.require(:job_post).permit(:title, :job_type, :description, :company_id, skill_assignments_attributes: [:skill_id, :level, :_detsroy] )
  end
end
