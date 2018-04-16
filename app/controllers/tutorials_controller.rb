class TutorialsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @tutorials = Tutorial.all
    @is_admin = current_user.admin? if current_user
  end

  def new
    redirect_to '/tutorials' unless current_user.admin?
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.create(tutorial_params)
    redirect_to '/tutorials'
  end

  def edit
    redirect_to '/tutorials' unless current_user.admin?
    @tutorial = Tutorial.find(params[:id])
  end

  def update
    @tutorial = Tutorial.find(params[:id])
    @tutorial.update_attributes(tutorial_params)
    redirect_to "/tutorials/#{params[:id]}"
  end

  def show
    @tutorial = Tutorial.find(params[:id])
    @tutorials = CollateTutorialsByLanguageService.new(@tutorial).call
  end

  def destroy
    Tutorial.find(params[:id]).destroy
    redirect_to '/tutorials'
  end

  private

  def tutorial_params
    params.require(:tutorial).permit(:title,
                                     :link,
                                     :rating,
                                     :language,
                                     :suitability,
                                     :type_of_tutorial,
                                     :avatar)
  end
end
