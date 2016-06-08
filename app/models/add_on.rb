class AddOn < ActiveRecord::Base
  extend PublishHelper
  
  has_many :additions
  has_many :add_ons, :through => :additions
  
  validates :name, :presence => true
end
