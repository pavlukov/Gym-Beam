class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @sport_sections = []
    else
      @sport_sections = SportSection.search params[:q]
    end

    binding.pry
  end
end
