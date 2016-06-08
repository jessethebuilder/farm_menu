module PublishHelper
  def published
    self.where(:published => true)
  end
end