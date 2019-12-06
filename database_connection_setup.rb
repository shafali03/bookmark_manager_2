require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'bookmark_manager_test')
  p "here"
else
  DatabaseConnection.setup(dbname: 'bookmark_manager')
  p "here2"
end