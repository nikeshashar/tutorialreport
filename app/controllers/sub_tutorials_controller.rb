class SubTutorialsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @sub_tutorials = SubTutorial.all
    @is_admin = current_user.admin? if current_user
  end

  def new
    redirect_to '/sub_tutorials' unless current_user.admin?
    @sub_tutorial = SubTutorial.new
  end

  def create
    @sub_tutorial = SubTutorial.create(sub_tutorial_params)
    redirect_to '/sub_tutorials'
  end

  def edit
    redirect_to '/sub_tutorials' unless current_user.admin?
    @sub_tutorial = SubTutorial.find(params[:id])
  end

  def update
    @sub_tutorial = SubTutorial.find(params[:id])
    @sub_tutorial.update_attributes(sub_tutorial_params)
    redirect_to "/sub_tutorials/#{params[:id]}"
  end

  def show
    @sub_tutorial = SubTutorial.find(params[:id])
    @is_admin = current_user.admin? if current_user
  end

  def destroy
    SubTutorial.find(params[:id]).destroy
    redirect_to '/sub_tutorials'
  end

  private

  def sub_tutorial_params
    params.require(:sub_tutorial).permit(:title,
                                         :link,
                                         :rating,
                                         :language,
                                         :suitability,
                                         :type_of_tutorial)
  end
end
