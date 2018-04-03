class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @tutorials = []
    else
      @tutorials = Tutorial.search(params[:q])
    end
  end
end
