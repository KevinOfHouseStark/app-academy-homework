require_relative '03_associatable'
require 'byebug'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
    define_method(name) do 
      through_opts = self.class.assoc_options[through_name]
      source_opts = through_opts.model_class.assoc_options[source_name]

      data = DBConnection.execute(<<-SQL)
      SELECT
        #{source_opts.table_name}.*
      FROM
        #{through_opts.table_name}
      JOIN
        #{source_opts.table_name} 
      ON 
        #{source_opts.table_name}.#{source_opts.primary_key} = #{through_opts.table_name}.#{source_opts.foreign_key}
      WHERE
        #{through_opts.table_name}.#{source_opts.foreign_key} = #{source_opts.table_name}.#{source_opts.primary_key}
      SQL

      source_opts.model_class.parse_all(data).first
    end
  end
end