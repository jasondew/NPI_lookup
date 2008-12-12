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
    model_class.paginate :all, :conditions => conditions, :joins => joins, :order => DEFAULT_SORT, :page => page, :per_page => per_page
  end

  def raw_criteria
    attributes
  end

  def criteria
    nonblank_attributes = attributes.reject {|(key, value)| value.blank? }

    nonblank_attributes.collect do |(key, value)|
      begin
        if key.include?('_id') and
           (model = key.gsub(/_id$/, '').camelize.constantize) and
           (instance = model.find(:first, :conditions => {:id => value}))
           [key, instance.send(model.field_name)]
        else
          [key, value]
        end
      rescue
        [key, value]
      end
    end
  end

  module ClassMethods

    def define_equality_condition *attribute_names
      define_conditions(attribute_names) do |field_name, value|
        ["#{field_name} = ?", value] if value
      end
    end

    def define_maximal_condition *attribute_names
      define_conditions(attribute_names) do |field_name, value|
        field_name.gsub! /^maximum_/, ''
        ["#{field_name} <= ?", value] if value
      end
    end

    def define_minimal_condition *attribute_names
      define_conditions(attribute_names) do |field_name, value|
        field_name.gsub! /^minimum_/, ''
        ["#{field_name} >= ?", value] if value
      end
    end

    def define_approximate_condition *attribute_names
      define_conditions(attribute_names) do |field_name, value|
        ["#{field_name} LIKE ?", "%#{value}%"] unless value.blank?
      end
    end

    def define_within_n_days_condition *attribute_names
      define_conditions(attribute_names) do |field_name, value|
        ["#{field_name} <= ?", value.days.from_now] if value
      end
    end

    private

    def define_conditions attribute_names, &block
      attribute_names.each do |names|
        method_name, mapping, field_name = names
        field_name ||= method_name
        condition_method_name = "#{method_name}_condition"

        define_method(condition_method_name) do
          value = send(method_name)
          value = mapping[value] if mapping and value

          block[field_name.to_s, value]
        end

        send :private, condition_method_name
      end
    end

  end

  private

  # standard conditions

  def city_id_condition
    ["listings.city_id = ?", city_id]
  end

  # standard joins

  def listing_join
    "LEFT JOIN listings ON listings.listable_id = #{table_name}.id"
  end
 
  # plumbing

  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
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
