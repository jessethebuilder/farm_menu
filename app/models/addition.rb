class Addition < ActiveRecord::Base
  belongs_to :product
  belongs_to :add_on
end
