require 'rails_helper'

RSpec.describe Addition, type: :model do
  describe 'Associations' do
    it{ should belong_to :product }
    it{ should belong_to :add_on }
  end
end
