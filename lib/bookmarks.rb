require 'pg'

class Bookmarks

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

     result = connection.exec("SELECT * FROM bookmarks")
     result.map { |item| item["url"] }
  end

  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    p url
    connection.exec("INSERT INTO bookmarks(url) VALUES('#{url}');")
  end

end
