require 'spec_helper'

describe "SearchSpec", type: :feature, js: true do
  before :each do
  
  end

  it "should returns results" do
    visit 'http://link.springer.com/search'
    within("#global-search") do
      fill_in 'query', with: 'web security'
    end
    click_button 'Submit'
    expect(page).to have_current_path '/search?query=web+security'
    expect(page).to have_selector 'ol#results-list'
  end

  it "should display no results message" do
    visit 'http://link.springer.com/search'
    within("#global-search") do
      fill_in 'query', with: 'dsfasdfsaddsffsd'
    end
    click_button 'Submit'
    expect(page).to have_content "0 Result(s) for 'dsfasdfsaddsffsd'"
  end
end
