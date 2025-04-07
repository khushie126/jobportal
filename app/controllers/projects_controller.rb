class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end
end
