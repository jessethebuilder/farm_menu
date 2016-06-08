require 'rails_helper'

RSpec.describe Section, type: :model do
  let(:section){ build :section }
  
  describe "Validations" do
    it{ should validate_presence_of :name }
  end
  
  describe 'Associations' do
    it{ should belong_to :menu }
    
    it{ should have_many :products }
    it 'should destroy Products when destroyed' do
      p = create(:product)
      section.products << p
      section.destroy
      p.destroyed?.should == true
    end
  end
  
  describe 'Idioms' do
    it 'should use_farm_slugs' do
      section.name = 'A Section Name'
      section.save!
      section.slug.should == 'a-section-name'
    end
    
    specify 'Default order should be :order' do
      menu = create(:menu)
      s1 = create(:section, :order => 2)
      s2 = create(:section, :order => 1)
      menu.sections << [s1, s2]
      menu.sections.last.should == s1
    end
  end
  
  describe 'Attributes' do
    describe '#published' do
      it 'should default to true' do
        section.published.should == true
      end
    end
  end # Attributes
  
  describe 'Methods' do
  end # Methods
 
  describe 'Class Methods' do
    describe '#published' do
      it 'should return Sections where published == true' do
        s = create(:section)
        s2 = create(:section, :published => false)
        Section.published.count.should == 1
      end 
    end
  end
end
