feature 'View a list of bookmarks' do
  scenario 'See all bookmarks at once' do

    # DatabaseConnection.setup(dbname: 'bookmark_manager_test')

    Bookmark.create(url: "http://www.github.com", title: 'github')
    Bookmark.create(url: "http://www.makersacademy.com", title: 'makers')
    Bookmark.create(url: "http://www.google.com", title: 'google')

    visit '/bookmarks'

    expect(page).to have_content "github"
    expect(page).to have_content "makers"
    expect(page).to have_content "google"
  end
end
