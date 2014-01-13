require 'spec_helper'

feature "Editing Projects" do
  before do
    project = FactoryGirl.create(:project, name: "TextMate 2")

    visit '/'
    click_link 'TextMate 2'
    click_link 'Edit'
  end

  scenario 'Updating a project' do
    fill_in "Name", with: "TextMate 2 Beta"
    click_button 'Update Project'

    expect(page).to have_content("Project has been updated")
  end

  scenario 'Updating a project without name is bad' do
    fill_in "Name", with: ""
    click_button 'Update Project'

    expect(page).to have_content("Project has not been updated")
  end
end

