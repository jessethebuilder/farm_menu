require'rails_helper'

describe 'Editing Sections', :type => :feature do
  let(:section){ create :section }
  
  before(:each) do
    menu.sections << section
  end
end
