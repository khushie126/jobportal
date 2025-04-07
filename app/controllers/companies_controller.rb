class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role , only: [:edit, :update, :create, :new]
  def index
    @company = Company.all
  end
  def show
    @company = Company.find(params[:id])
    if @company.nil?
      flash[:alert] = "Company not found."
      redirect_to new_company_path
    end
  end
  def new
    @company = Company.new
  end
  
  def create
    @company= Company.new(company_params)
    if @company.save
      redirect_to @company, notice: "Company profile successfully created."
    else
      render :new
    end
  end
  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to @company
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
  def company_params
    params.require(:company).permit(:company_name, :description, :location, :review)
  end
end
