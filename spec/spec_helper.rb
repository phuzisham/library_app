require('rspec')
require('pg')
require('catalog')
require('book')

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM books *;')
    DB.exec('DELETE FROM authors *;')
  end
end
