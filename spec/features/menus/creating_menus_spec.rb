require 'rails_helper'

describe 'Creating Menus Spec', :type => :feature do
  it 'should save with minimum fields filled in' do
    menu_min
    expect{ click_button 'Create Menu' }.to change{ Menu.count }.by(1)
  end
  
  describe 'Attributes' do
    it 'should save :name' do
      str = Faker::Name.name
      menu_min
      fill_in 'menu_name', :with => str
      click_button 'Create Menu'
      Menu.last.name.should == str  
    end
    
    it 'should save :description' do
      str = Faker::Name.name
      menu_min
      fill_in 'menu_description', :with => str
      click_button 'Create Menu'
      Menu.last.description.should == str  
    end
    
    it 'should save :published' do
      menu_min
      uncheck 'menu_published'
      click_button 'Create Menu'
      Menu.last.published.should == false
    end
    
  end # Control Attributes
end
