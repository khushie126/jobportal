class EducationsController < ApplicationController
  def index
    @education = Education.all
  end
end

