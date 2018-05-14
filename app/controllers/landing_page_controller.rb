class LandingPageController < ApplicationController
  def index
    puts "REACHED THIS SHIT YO!!"
    @tutorials = Tutorial.all
    puts "THIS IS WHAT IT LOOKS LIKE >>>>#{@tutorials.first.language.capitalize}"
  end
end
