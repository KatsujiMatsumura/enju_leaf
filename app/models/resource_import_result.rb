class ResourceImportResult < ActiveRecord::Base
  default_scope :order => 'resource_import_results.id'
  scope :file_id, proc{|file_id| {:conditions => {:resource_import_file_id => file_id}}}
  scope :failed, {:conditions => {:manifestation_id => nil}}

  belongs_to :resource_import_file
  belongs_to :manifestation, :class_name => 'Resource'
  belongs_to :item

  validates_presence_of :resource_import_file_id
end