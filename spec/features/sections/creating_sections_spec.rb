require 'rails_helper'

describe 'Creating Sections', :type => :feature do
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
end
