feature 'Bookmark display' do
  scenario 'Check index is showing bookmarks' do
    visit('/')
    expect(page).to have_content 'New bookmark'
  end
end
