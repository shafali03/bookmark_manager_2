
require 'pg'

def setup_test_database
  p 'Setting up test database...'

  #clear the bookmarks table
  DatabaseConnection.query("TRUNCATE bookmarks;")
end
