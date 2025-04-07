class ExperiencesController < ApplicationController
  def index
    @experience = Experience.all
  end
end
