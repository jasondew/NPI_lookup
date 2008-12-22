class ProviderSearchesController < ApplicationController

  def new
    @provider_search = ProviderSearch.new
  end

  def create
    @provider_search = ProviderSearch.new params[:provider_search]
    @providers = @provider_search.results
  end

end
