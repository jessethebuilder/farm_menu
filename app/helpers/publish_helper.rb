module PublishHelper
  # This gets extended in ActiveRecord objects
  
  def published
    self.where(:published => true)
  end
end