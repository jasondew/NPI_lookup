ActionController::Routing::Routes.draw do |map|
  map.resources :providers
  map.resources :provider_searches

  map.root :controller => "ProviderSearches", :action => "new"
end
