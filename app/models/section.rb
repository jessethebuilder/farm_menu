class Section < ActiveRecord::Base
  extend PublishHelper  
  
  default_scope{ order(:order) }
  
  belongs_to :menu
    
  validates :name, :presence => true
  
  has_many :products, :dependent => :destroy
  
  use_farm_slugs
end
