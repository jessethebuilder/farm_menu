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
end