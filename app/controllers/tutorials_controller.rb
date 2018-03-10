class TutorialsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @tutorials = Tutorial.all
  end
end
