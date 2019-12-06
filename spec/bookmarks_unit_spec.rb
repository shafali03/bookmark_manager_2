require 'bookmark'
require 'database_connection'


describe Bookmark do

  describe '#all' do
    it 'should list bookmarks' do

      Bookmark.create(url: "http://www.github.com", title: 'github')
      Bookmark.create(url: "http://www.makersacademy.com", title: 'makers')
      Bookmark.create(url: "http://www.google.com", title: 'google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(3)
      expect(bookmarks[0]).to be_a Bookmark
      expect(bookmarks[0].url).to eq("http://www.github.com")
      expect(bookmarks[0].title).to eq("github")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: "http://www.github.com", title: 'github')
      persisted_data = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
  
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'github'
      expect(bookmark.url).to eq 'http://www.github.com'
    end
  end

  describe ".find" do
    it "should return a requested bookmark" do
      bookmark = Bookmark.create(url: "http://www.makersacadamy.com", title: 'makers')
      result = Bookmark.find(id: bookmark.id)

      expect(result.url).to eq("http://www.makersacadamy.com")
    end
  end

  it "validates url entries" do
    Bookmark.create(url: "google", title: 'google')
    results = Bookmark.all.map { |bookmark| bookmark.title }

    expect(results).not_to include('google')
  end
end
