class Menu < ActiveRecord::Base
  extend PublishHelper

  use_farm_slugs
  
  use_open_close
  
  validates :name, :presence => true
  
  has_many :sections, :dependent => :destroy
  accepts_nested_attributes_for :sections, :allow_destroy => true
end
