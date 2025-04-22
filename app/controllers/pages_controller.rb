class PagesController < ApplicationController
  
  def home
    @pi = ProfileInformation.all
  end
end
