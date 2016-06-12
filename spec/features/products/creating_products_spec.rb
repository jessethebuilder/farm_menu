require 'rails_helper'

describe 'Creating Products Requests', :type => :feature do
  #Products created through Menu
  
  it 'should save products' do
    product_min
    expect{ click_button 'Create Menu' }.to change{ Product.count }.by(1)
  end
  
  describe 'Control Attributes' do
    it 'should save :name' do
      product_min
      n = Faker::Name.name
      fill_in 'menu_sections_attributes_0_products_attributes_0_name', :with => n
      click_button 'Create Menu'
      Menu.last.sections.last.products.last.name.should == n
    end
    
    it 'should save :description' do
      product_min
      d = Faker::Lorem.paragraphs.join('<br><br>')
      fill_in 'menu_sections_attributes_0_products_attributes_0_description', :with => d
      click_button 'Create Menu'
      Menu.last.sections.last.products.last.description.should == d
    end
    
    it 'should save :published' do
      product_min
      uncheck 'menu_sections_attributes_0_products_attributes_0_published'
      click_button 'Create Menu'
      Menu.last.sections.last.products.last.published.should == false
    end
    
    it 'should save :available' do
      product_min
      uncheck 'menu_sections_attributes_0_products_attributes_0_available'
      click_button 'Create Menu'
      Menu.last.sections.last.products.last.available.should == false
    end
    
    it 'should NOT show destroy? option' do
      product_min
      page.should_not have_css('#menu_sections_attributes_0_products_attributes_0__destroy')
    end
  end # Control Attributes
  
  
end
