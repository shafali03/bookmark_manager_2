feature 'View a list of bookmarks' do
  scenario 'See all bookmarks at once' do

    Bookmarks.create(url: "http://www.github.com")
    Bookmarks.create(url: "http://www.makersacademy.com")
    Bookmarks.create(url: "http://www.google.com")

    visit '/bookmarks'

    expect(page).to have_content "http://www.github.com"
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
  end
end
