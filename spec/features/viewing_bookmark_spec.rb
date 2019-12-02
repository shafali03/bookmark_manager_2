feature 'View a list of bookmarks' do
  scenario 'See all bookmarks at once' do
    visit '/bookmarks'
    expect(page).to have_content "http://www.google.com"
  end
end