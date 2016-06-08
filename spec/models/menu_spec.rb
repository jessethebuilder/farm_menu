require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:menu){ build :menu }
  
  describe 'Validations' do
    it{ should validate_presence_of :name }
  end
  
  describe 'Associations' do
    it{ should have_many :openings }
    
    it{ should have_many :sections }
    it{ should accept_nested_attributes_for :sections }
    it 'should destroy Sections upon destroy' do
      section = build(:section)
      menu.save
      menu.sections << section
      menu.destroy
      section.destroyed?.should == true
    end
    
  end
  
  describe 'Idioms' do
    it 'should use_farm_slugs' do
      menu.save!
      menu.slug.should == menu.name.parameterize
    end
    
    describe 'open_close' do
      describe '#is_open?' do
        it 'should return true if no Opening is open' do
          t = Time.now
          o = Opening.new :day_of_week => t.strftime('%A'), :open_time => Time.now + 1.hour, :close_time => Time.now + 2.hours
          menu.is_open?.should == false  
        end
        
        it 'should return true if an Opening is open' do
          t = Time.now
          o = Opening.new :day_of_week => t.strftime('%A'), :open_time => Time.now - 1.hour, :close_time => Time.now + 1.hour
          menu.openings << o
          menu.is_open?.should == true
        end
      end
    end
  end
  
  describe 'Attributes' do
    describe '#published' do
      it 'should default to true' do
        menu.published.should == true
      end
    end
  end # Attributes
  
  describe 'Methods' do
  end # Methods
  
  describe 'Class Methods' do
    describe '#published' do
      it 'should return Menus where published == true' do
        m = create(:menu)
        m2 = create(:menu, :published => false)
        Menu.published.count.should == 1
      end 
    end
  end
end
