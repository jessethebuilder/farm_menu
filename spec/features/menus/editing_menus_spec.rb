require 'rails_helper'

describe 'Editing Menu Requests', :type => :feature do
  let!(:menu){ create :menu }
  
  describe 'Editing Sections' do
    let(:section){ create :section }
    
    before(:each) do
      menu.sections << section
    end
    
    it 'should destroy through form' do
      visit "/menus/#{menu.to_param}/edit"  
      check 'menu_sections_attributes_0__destroy'
      expect{ click_button 'Update Menu' }.to change{ Section.count }.by(-1)
    end
    
    describe 'Editing Products' do
      let!(:product){ create :product }
      
      before(:each) do 
         menu.sections.first.products << product
      end
       
      it 'should destroy through form' do
        product_min
        check "menu_sections_attributes_0_products_attributes_0__destroy"
        expect{ click_button "Create Menu" }.to change{ Product.count }.by(-1)  
      end
    end # Editing Products
  end
end
