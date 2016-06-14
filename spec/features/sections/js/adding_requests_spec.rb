require 'rails_helper'

describe 'Adding Sections Helper', :type => :feature, :js => true do
  let(:menu){ create :menu }
  let(:section){ create :section }
  
  it 'New Menu should have a single Section' do
    visit '/menus/new'
    within('#sections') do
      page.should have_selector('.section', :count => 1)
    end
  end
  
  
  it 'should add a new Menu Section when the name of all Menu sections are filled' do
    visit '/menus/new'
    fill_in 'menu_sections_attributes_0_name', :with => 'xxx'
    within('#sections') do
      page.should have_selector('.section', :count => 2)
    end
  end
  
  it 'should add additional Sections as sections fill' do
    
  end
  
  it 'should show menu sections when they exist on Menu' do
    menu.sections << section
    
    visit "/menus/#{menu.to_param}/edit"
    find_field('menu_sections_attributes_0_name').value.should == section.name
  end
  
  it 'should always show a blank menu section' do
    4.times{ menu.sections << section.dup }
    menu.reload
    
    visit "/menus/#{menu.to_param}/edit"
    
    within('#sections') do
      page.should have_selector('.section', :count => 5)  
    end
  end
end
