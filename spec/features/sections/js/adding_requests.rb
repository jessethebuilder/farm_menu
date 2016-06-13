require 'rails_helper'

describe 'Adding Sections Helper', :type => :feature, :js => true do
  it 'New Menu should have a single Section' do
    visit '/menus/new'
    within('#sections') do
      find(:css, '.section').count.should == 1
    end
  end
end
