require 'databaseconnection'
require 'pg'

describe DatabaseConnection do
  describe '#setup' do
    it 'setups a new connection' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end
  describe '#connection' do
    it 'tests that it creates a connection to database' do
      my_connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq my_connection
    end
  end

  describe '#query' do
    it 'test that connection executes the query' do
      DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to receive(:exec).with("SELECT * FROM links")
      DatabaseConnection.query("SELECT * FROM links")
    end
  end
end
