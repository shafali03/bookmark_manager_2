require 'pg'
require_relative 'valid'

class Bookmark

  attr_reader :id, :url, :title
  
  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map do |item|
      new(id: item['id'], url: item['url'], title: item['title'])
    end
  end

  def self.create(url:, title:)
    return unless Valid.url(url)
    

    result = DatabaseConnection.query("INSERT INTO bookmarks(url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end
 
  def self.edit(id:, url:, title:)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id}")
  end


  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
    new(id: result[0]["id"], url: result[0]["url"], title: result[0]["title"])
  end
end