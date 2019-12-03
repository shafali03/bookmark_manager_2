feature 'Add bookmark' do
  scenario 'Should add a bookmark and show the new bookmark in the list' do
    visit('/')
    click_on 'Add link'
    fill_in 'url', with: 'http://www.codewars.com'
    click_on 'Submit'
    expect(page).to have_content 'http://www.codewars.com'
  end
end
