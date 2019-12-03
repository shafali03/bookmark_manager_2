require 'bookmarks'

describe Bookmarks do

  describe '#all' do
    it 'should list bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmarks.create(url: "http://www.github.com")
      Bookmarks.create(url: "http://www.makersacademy.com")
      Bookmarks.create(url: "http://www.google.com")

      expect(Bookmarks.all).to include("http://www.github.com")
      expect(Bookmarks.all).to include("http://www.makersacademy.com")
      expect(Bookmarks.all).to include("http://www.google.com")
    end
  end
end
