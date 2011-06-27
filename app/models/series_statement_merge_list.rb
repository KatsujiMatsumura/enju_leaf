class SeriesStatementMergeList < ActiveRecord::Base
  has_many :series_statement_merges, :dependent => :destroy
  has_many :series_statements, :through => :series_statement_merges
  validates_presence_of :title

  def self.per_page
    10
  end

  def merge_series_statements(selected_series_statement)
    self.series_statements.each do |series_statement|
      series_statement.destroy unless series_statement == selected_series_statement
    end
  end
end
