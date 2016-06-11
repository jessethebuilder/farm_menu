class Section < ActiveRecord::Base
  extend PublishHelper  
  
  default_scope{ order(:order) }
  
  belongs_to :menu
    
  validates :name, :presence => true
  
  has_many :products, :dependent => :destroy
  accepts_nested_attributes_for :products, :reject_if => :product_is_invalid?, :allow_destroy => true
  
  use_farm_slugs
  
  private
  
  def product_is_invalid?(attrs)
    attrs[:name].blank?
  end
end
