class Product < ActiveRecord::Base
  extend PublishHelper
  
  default_scope{ order(:order) }
  
  belongs_to :section
  
  validates :name, :presence => true
  
  use_farm_slugs
  
  has_many :additions
  has_many :add_ons, :through => :additions
end
