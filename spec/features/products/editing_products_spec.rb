require 'rails_helper'
   
describe 'Editing Products', :type => :feature do
  # Through Menu Form
  
  let!(:menu){ create :menu }
  let!(:section){ create :section }
  let!(:product){ create :product }
  
  before(:each) do 
    menu.sections << section
    menu.sections.first.products << product
  end
   
  it 'should destroy through form' do
    visit "menus/#{menu.to_param}/edit"
    check "menu_sections_attributes_0_products_attributes_0__destroy"
    expect{ click_button "Update Menu" }.to change{ Product.count }.by(-1)  
  end
end # Editing Products