class ProviderSearchesController < ApplicationController

  def new
  end

  def create
    @provider_search = @city.provider_searches.build params[:provider_search]
    @providers = @provider_search.results
  end

end
