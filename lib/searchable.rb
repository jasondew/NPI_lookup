module Searchable

  DEFAULT_SORT = 'created_at'

  def self.included base
    class_name = base.to_s.gsub(/Search$/, '')

    base.instance_variable_set "@table_name", class_name.tableize
    base.instance_variable_set "@klass", class_name.constantize

    base.extend ClassMethods
  end

  def model_class
    self.class.instance_variable_get "@klass"
  end

  def table_name
    self.class.instance_variable_get "@table_name"
  end

  def results page = 1, per_page = 30
    page = 1 if page <= 0
    model_class.paginate :all, :conditions => conditions, :order => DEFAULT_SORT, :page => page, :per_page => per_page
  end

  def raw_criteria
    attributes
  end

  def criteria
    attributes.reject {|(key, value)| value.blank? }
  end

  private

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
    private_methods.grep(/_condition$/).map { |m| send(m) }.compact
  end

  def joins
    join_parts.join ' '
  end
  
  def join_parts
    private_methods.grep(/_join$/).map { |m| send(m) }.compact
  end

end
