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
    
    it 'should NOT show Destroy button on new form' do
      visit '/menus/new'
      page.should_not have_link('Destroy')
    end
  end # Control Attributes
  
  describe 'Section Attributes' do
    it 'should save sections' do
      menu_min
      name = Faker::Name.name
      fill_in 'menu_sections_attributes_0_name', with: name
      expect{ click_button 'Create Menu' }.to change{ Section.count }.by(1)
    end
    
    it 'should save section :name' do
      menu_min
      name = Faker::Name.name
      fill_in 'menu_sections_attributes_0_name', with: name
      click_button 'Create Menu'
      Menu.last.sections.first.name.should == name
    end
    
    it 'should save :published' do
      section_min
      uncheck 'menu_sections_attributes_0_published' 
      click_button 'Create Menu'
      Menu.last.sections.first.published.should == false
    end
    
    it 'should save :description' do
      d = Faker::Lorem.paragraphs.join("<br><br>")
      section_min
      fill_in "menu_sections_attributes_0_description", :with => d
      click_button 'Create Menu'
      Menu.last.sections.first.description.should == d
    end
    

    
  end # Section Attributes
end
