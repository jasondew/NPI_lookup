class ProviderSearch < ActiveRecord::Base

  DEFAULT_SORT = 'organization_name'

  def results page = 1, per_page = 25
    Provider.paginate :all,
                      :conditions => conditions,
                      :order => DEFAULT_SORT,
                      :page => (page <= 0 ? 1 : page),
                      :per_page => per_page
  end

  private

  def npi_condition
    ["npi like ?", "%#{npi}%"] unless npi.blank?
  end

  def organization_name_condition
    ["organization_name like ?", "%#{organization_name}%"] unless organization_name.blank?
  end

  def last_name_condition
    ["last_name like ?", "%#{last_name}%"] unless last_name.blank?
  end

  def taxonomy_condition
    [(1..15).map {|index| "taxonomy_#{index} like ?" }.join(' OR '),
     ["%#{taxonomy}%"] * 15].flatten unless taxonomy.blank?
  end

  def postal_code_condition
    ["mailing_postal_code like ? OR practice_postal_code like ?",
     ["%#{postal_code}%"] * 2].flatten unless postal_code.blank?
  end

  # plumbing

  def conditions
    [conditions_clauses.join(' OR '), *conditions_options]
  end
  
  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end
  
  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end
  
  def conditions_parts
    @conditions_parts ||= private_methods.grep(/_condition$/).map {|m| send(m) }.compact
  end

  def joins
    join_parts.join ' '
  end
  
  def join_parts
    private_methods.grep(/_join$/).map { |m| send(m) }.compact
  end

end
