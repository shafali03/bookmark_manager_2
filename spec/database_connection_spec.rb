require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'sets up a database through pg' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup(dbname: 'bookmark_manager_test')

    end
  end

  describe ".query" do
    it "executes a query via PG" do
      connection = DatabaseConnection.setup(dbname: 'bookmark_manager_test')

      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")

      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end

end