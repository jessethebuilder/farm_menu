require 'rails_helper'

RSpec.describe AddOn, type: :model do
  describe 'Validations' do
    it{ should validate_presence_of :name }
  end
  
  describe 'Associations' do
    it{ should have_many :additions }
    it{ should have_many(:add_ons).through(:additions) }
  end
    
  describe 'Class Methods' do
    describe '#published' do
      it 'should return AddOns where published == true' do
        a = create(:add_on)
        a2 = create(:add_on, :published => false)
        AddOn.published.count.should == 1
      end 
    end
  end
end
