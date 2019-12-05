feature "updating a bookmark" do
  scenario "User can update a bookmark" do
    Bookmark.create(url: 'http://www.makers.com', title: "makers")
    visit('/bookmarks')
    

    within('.makers') do
      click_button 'edit'
    end

    fill_in "url", with: "https://www.google.com"
    fill_in "title", with: "Google"
    click_button "submit"

    expect(page).not_to have_link("makers", href: "http://www.makers.com")
    expect(page).to have_link("Google", href: "https://www.google.com")
  end
end