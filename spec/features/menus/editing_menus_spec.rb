require 'rails_helper'

describe 'Editing Menu Requests', :type => :feature do
  let!(:menu){ create :menu }
  
  
    it 'should show Destroy button on Edit form' do
      visit "/menus/#{menu.to_param}/edit"
      page.should have_link('Destroy')
    end
  
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
  end
end
