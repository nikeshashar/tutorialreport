class LandingPageController < ApplicationController
  def index
    @tut1 = Tutorial.first
    @tut2 = Tutorial.last(2).first
    @tut3 = Tutorial.last
  end
end
