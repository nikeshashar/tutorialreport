class TutorialsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @tutorials = Tutorial.all
  end
end
