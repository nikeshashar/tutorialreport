class TutorialsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @tutorials = Tutorial.all
  end

  def new
    redirect_to '/tutorials' unless current_user.admin?
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.create(tutorial_params)
    redirect_to '/tutorials'
  end

  private

  def tutorial_params
    params.require(:tutorial).permit(:title,
                                     :link,
                                     :rating,
                                     :language,
                                     :suitability,
                                     :type)
  end
end
