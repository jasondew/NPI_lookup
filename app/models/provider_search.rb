class ProviderSearch < ActiveRecord::Base

  include Searchable

  define_approximate_condition :name, :npi

end
