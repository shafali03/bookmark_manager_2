# Bookmark-manager

<img width="904" alt="Screenshot 2019-12-02 at 14 30 55" src="https://user-images.githubusercontent.com/53044792/69967492-6bc5b300-1510-11ea-8867-2dc85adc18e1.png">


## Database setup instructions
1. $ brew install postgresql
- This install PostgreSQL to our directory

2. $ brew services start postgresql
- This launches postgresql when you login/run server

3. $ psql postgres
- Goes into the psql shell

In the psql shell:
4. CREATE DATABASE elizabethmanifold WITH OWNER elizabethmanifold ENCODING 'UTF8'
- Created a database for my home computer

5. \l
- Listed databases

6. \q
- Took us out of psql shell

7. $ psql
- Took us back into the psql shell

8. CREATE DATABASE bookmark_manager;
- Created a database called bookmark_manager

9. \c bookmark_manager
- Connected to the correct database

10. CREATE TABLE bookmarks(  
bookmark_manager(# id serial PRIMARY KEY,  
bookmark_manager(# url VARCHAR (60) UNIQUE NOT NULL  
bookmark_manager(# );  
- All above on separate lines of the psql shell, created a table

11. \d bookmarks
- Showed the columns that were in the bookmarks table that we just created

12. Run the query that can be found in db/migrations/01_create_bookmarks_table.sql


Setting up a test environment for database:
- Create a new database called bookmark_manager_test
- Create an identical table in there to the one in the real database
- Add an environment variable to spec_helper: ENV['ENVIRONMENT'] = 'test'
- Do an if statement in self.all to say that if env var is a test, then go to test database, else go to real db
- Add to unit test and feature test the:

connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

- Create a file in spec called spec_test_database.rb
- Add a method to it that includes connecting to the test db, and truncating afterwards. and require pg in the file
- In the spec_helper require that file you just created and add this to configure (do):

config.before(:each) do
    setup_test_database
  end
