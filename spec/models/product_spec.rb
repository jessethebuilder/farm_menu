require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product){ build :product }
  
  describe 'Validations' do
    it{ should validate_presence_of :name }
  end
  
  describe 'Associations' do
    it{ should belong_to :section }
    
    it{ should have_many :additions }
    it{ should have_many(:add_ons).through(:additions) }
  end
  
  describe 'Idioms' do
    it 'should use_farm_slugs' do
      product.save!
      product.slug.should == product.name.parameterize   
    end
  end
  
  describe 'Class Methods' do
    describe '#published' do
      it 'should return Products where published == true' do
        p = create(:product)
        p2 = create(:product, :published => false)
        Product.published.count.should == 1
      end 
    end
  end
end
