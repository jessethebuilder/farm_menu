module RequestSpecsHelper
  def manual_sign_in
    nil
  end
  
  #------------ Menus --------------
  def menu_min
    manual_sign_in
    visit '/menus/new'
    min_menu_fields
  end
  
  def min_menu_fields
    fill_in 'menu_name', :with => Faker::Name.name 
  end
  
  #------------ Sections -------------
  
  def section_min(index = "0")
    menu_min
    min_section_fields(index)
  end
  
  def min_section_fields(index = '0')
    # embedded in menu form
    fill_in "menu_sections_attributes_#{index}_name", :with => Faker::Name.name
  end
  
  #-------- Products ---------------
  def product_min(index = '0', section_index: '0')
    section_min(section_index)
    min_product_fields(index, section_index: section_index)
  end
  
  def min_product_fields(index = '0', section_index: "0")
    fill_in "menu_sections_attributes_#{section_index}_products_attributes_#{index}_name", :with => Faker::Name.name
  end
end