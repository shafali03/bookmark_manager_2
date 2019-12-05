feature 'Add bookmark' do
  scenario 'Should add a bookmark and show the new bookmark title in the list' do
    visit('/')
    click_on 'Add link'
    fill_in 'url', with: 'http://www.codewars.com'
    fill_in 'title', with: 'Codewars'
    click_on 'Submit'
    expect(page).to have_content 'Codewars'
  end

  scenario 'Should add a bookmark and have the link in a list' do
    visit('/')
    click_on 'Add link'
    fill_in 'url', with: 'http://www.github.com'
    fill_in 'title', with: 'github'
    click_on 'Submit'
    expect(page).to have_link('github', href: 'http://www.github.com')
  end
end
