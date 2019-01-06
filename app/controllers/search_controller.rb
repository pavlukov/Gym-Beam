class SearchController < ApplicationController
  def search
    current_uri = request.env['PATH_INFO']
    redirect_to search_path if current_uri != '/search'
    if params[:q].nil?
      @sport_sections = []
    else
      @sport_sections = SportSection.search("*#{params[:q]}*")
    end
  end
end
