
require 'pg'

def setup_test_database
  p 'Setting up test database...'

  DatabaseConnection.setup(dbname: 'bookmark_manager_test')

  #clear the bookmarks table
  DatabaseConnection.query("TRUNCATE bookmarks;")
end
