class Provider < ActiveRecord::Base

  has_one :authorized_official

  has_many :addresses
  has_many :identifiers, :class_name => "ProviderIdentifier"
  has_many :licenses,    :class_name => "ProviderLicense"
  has_many :taxonomies,  :class_name => "ProviderTaxonomy"

#  is_indexed :fields => %w{
#    npi organization_name last_name
#    postal_code*
#    taxonomy_*
#  }

end
