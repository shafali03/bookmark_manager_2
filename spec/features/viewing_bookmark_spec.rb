feature 'View a list of bookmarks' do
  scenario 'See all bookmarks at once' do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.github.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit '/bookmarks'
    
    expect(page).to have_content "http://www.github.com"
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
  end
end
