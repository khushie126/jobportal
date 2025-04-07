class AppliedJobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_applied_job, only: [:show, :edit, :update]
def index
  @applied_job =AppliedJob.all
end
def new
  
end
  def create
    @job_post = JobPost.find(params[:job_post_id])
    
    if AppliedJob.exists?(user_id: current_user.id, job_post_id: @jp.id)
      redirect_to @job_post, alert: 'You have already applied for this job.'
    else
      @applied_job = AppliedJob.new(user_id: current_user.id, job_post_id: @jp.id, status: :applied)

      if @applied_job.save
        redirect_to @jp, notice: 'You have successfully applied for the job.'
      else
        redirect_to @jp, alert: 'There was an error with your application.'
      end
    end
  end

  def show
    
     @applied_job = AppliedJob.find(params[:id])

  end

  def edit
    unless current_user.recruiter? || current_user.admin?
      redirect_to job_post_path(@applied_job.job_post), alert: 'You are not authorized to edit this status.'
    end
  end

  def update
    if current_user.recruiter? || current_user.admin?
      if @applied_job.update(applied_job_params)
        redirect_to job_post_path(@applied_job.job_post), notice: 'Status updated successfully.'
      else
        render :edit, alert: 'Failed to update status.'
      end
    else
      redirect_to job_post_path(@applied_job.job_post), alert: 'You are not authorized to update this status.'
    end
  end

  private

  def set_applied_job
    @applied_job = AppliedJob.find(params[:id])
  end

  def applied_job_params
    params.require(:applied_job).permit(:status)
  end
end
