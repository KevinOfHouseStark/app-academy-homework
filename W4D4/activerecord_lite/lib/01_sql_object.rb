require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns

    cols = DBConnection.execute2(<<-SQL)
    SELECT
      *
    FROM
      #{self.table_name}
    SQL

    @columns = cols.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        self.attributes[name]
      end

      define_method("#{name}=") do |val|
        self.attributes[name] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.name.underscore + "s"
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
    SELECT
      #{self.table_name}.*
    FROM
      #{self.table_name}
    SQL

    self.parse_all(data)
  end

  def self.parse_all(results)
    objects = []

    results.each do |result|
      objects << self.new(result)
    end

    objects
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
    SELECT
      #{self.table_name}.*
    FROM
      #{self.table_name}
    WHERE
      #{self.table_name}.id = ?
    SQL

    self.parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr, val|
      attr = attr.to_sym unless attr.is_a?(Symbol)
      raise "unknown attribute '#{attr}'" if !self.class.columns.include?(attr)

      self.send("#{attr}=", val) #<= @attributes[attr] = val
    end
  end

  def attributes
    @attributes ||= {}
    # row = DBConnection.execute2(<<-SQL)
    # SELECT
    #   *
    # FROM
    #   #{SQLObject.table_name}
    # WHERE
    #   #{SQLObject.table_name}.id = self.id
    # SQL
    # col_values = row.last
    # col_values.each do |k, v|
    #   @attributes[k.to_sym] = v 
    # end

    # @attributes
  end

  def attribute_values
    self.class.columns.map {|attr| self.send(attr)}
  end

  
  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(', ')
    
    question_marks = (["?"] * columns.count).join(", ")

    results = DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    columns = self.class.columns
    col_names = columns.map(&:to_s).join(' = ?, ') + " = ?"

    DBConnection.execute(<<-SQL, *attribute_values, id)
    UPDATE
      #{self.class.table_name}
    SET
      #{col_names}
    WHERE 
      #{self.class.table_name}.id = ?
    SQL
  end

  def save
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end
end
