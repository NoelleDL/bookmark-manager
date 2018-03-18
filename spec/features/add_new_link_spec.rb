require 'uri'

feature 'Adding a new link' do
  scenario 'A user can add a link to Bookmark Manager' do
    visit('/')
    fill_in('url', with: 'http://testlink.com')
    click_button('Add')

    expect(page).to have_content 'http://testlink.com'
  end

  scenario 'The link must be a valid URL' do
    visit('/')
    fill_in('url', with: 'not a real link')
    click_button('Add')

    expect(page).not_to have_content "not a real link"
    expect(page).to have_content "You must submit a valid URL."
  end
end
