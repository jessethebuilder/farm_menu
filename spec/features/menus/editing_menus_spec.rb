require 'rails_helper'

describe 'Editing Menu Requests', :type => :feature do
  let!(:menu){ create :menu }
  
  describe 'Editing Sections' do
    let(:section){ build :section }
    
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
