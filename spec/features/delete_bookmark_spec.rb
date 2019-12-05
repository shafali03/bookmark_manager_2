feature "delete a url" do
  scenario "delete a bookmark from the database" do
    Bookmark.create(url: 'http://www.makers.com', title: "makers")

    visit('/bookmarks')

    within(".makers") do
      click_button 'Delete'
    end

    expect(page).not_to have_link('makers', href: 'http://www.makers.com')

  end
end