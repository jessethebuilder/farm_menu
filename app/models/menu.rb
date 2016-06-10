class Menu < ActiveRecord::Base
  extend PublishHelper

  use_farm_slugs
  
  use_open_close
  
  validates :name, :presence => true
  
  has_many :sections, :dependent => :destroy
  accepts_nested_attributes_for :sections, :allow_destroy => true, :reject_if => :section_is_invalid?
  
  private
  
  def section_is_invalid?(s)
    s['name'].blank?
  end
end
