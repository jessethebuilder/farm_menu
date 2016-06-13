require 'rails_helper'

describe 'Destroying Menus' do
  let!(:menu){ create :menu }
  
  it 'should NOT show Destroy button on new form' do
    visit '/menus/new'
    page.should_not have_link('Destroy')
  end
  
  it 'should show Destroy button on Edit form' do
    visit "/menus/#{menu.to_param}/edit"
    page.should have_link('Destroy')
  end
  
  it 'should destroy menu through form' do
    visit "/menus/#{menu.to_param}/edit"
    expect{ click_link 'Destroy' }.to change{ Menu.count }.by(-1)
    
  end
end
