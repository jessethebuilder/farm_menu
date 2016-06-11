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
  end
  
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
    
    describe 'Product Attributes' do
      it 'should save products' do
        product_min
        expect{ click_button 'Create Menu' }.to change{ Product.count }.by(1)
      end
      
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
      
      it 'should NOT save is :_destroy is selected' do
        product_min
        check 'menu_sections_attributes_0_products_attributes_0__destroy'
        expect{ click_button 'Create Menu' }.to_not change{ Product.count }
      end
    end # Product Attributes'
    
  end # Section Attributes
end
