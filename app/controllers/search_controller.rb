class SearchController < ApplicationController
  def index
    if params[:search]
      @search_term = params[:search]
      @results = PgSearch.multisearch(@search_term)
    end
  end
end
