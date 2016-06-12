require 'rails_helper'

describe 'Destroying Menus' do
  let!(:menu){ create :menu }
  
  it 'should destroy menu through form' do
    visit "/menus/#{menu.to_param}/edit"
    expect{ click_link 'Destroy' }.to change{ Menu.count }.by(-1)
    
  end
end
