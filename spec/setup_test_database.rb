
require 'pg'

def setup_test_database
  DatabaseConnection.setup(dbname: 'bookmark_manager_test')

  DatabaseConnection.query("TRUNCATE bookmarks;")
end
