class LandingPageController < ApplicationController
  def index
     @tutorials = CollateTutorialsForLandingPageService.new.call
  end
end
