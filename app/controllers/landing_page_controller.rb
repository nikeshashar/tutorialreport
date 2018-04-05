class LandingPageController < ApplicationController
  def index
    @tutorials = Tutorial.all
  end
end
