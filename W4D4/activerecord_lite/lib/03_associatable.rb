require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  attr_reader :options

  def initialize(name, options = {})
    @options = {
      class_name: name.to_s.singularize.camelcase(:upper),
      primary_key: :id,
      foreign_key: ("#{name}_id").to_sym }

    options.each do |key, val|
      @options[key] = val
    end

    @options.each do |k, v|
      self.send("#{k}=", v)
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @options = {
    class_name: name.to_s.singularize.camelcase(:upper),
    primary_key: :id,
    foreign_key: ("#{self_class_name.downcase}_id").to_sym
    }

    options.each do |key, val|
      @options[key] = val
    end

    @options.each do |k, v|
      self.send("#{k}=", v)
    end
  end
end

module Associatable
  attr_accessor :assoc_options
  # Phase IIIb
  def belongs_to(name, options = {})
    self.assoc_options[name] = BelongsToOptions.new(name, options)
    belongs = self.assoc_options[name]

    define_method(name) do
      foreign_key = self.send(belongs.foreign_key)
      var = belongs.model_class.where(belongs.primary_key => foreign_key)
      var.first
    end
  end

  def has_many(name, options = {})
    self.assoc_options[name] = HasManyOptions.new(name, self.name, options)
    many = self.assoc_options[name]

    define_method(name) do
      primary_key = self.send(many.primary_key)
      var = many.model_class.where(many.foreign_key => primary_key)
    end
  end

  def assoc_options
    @assoc_options ||= {}
  end
end

class SQLObject
  extend Associatable
end
