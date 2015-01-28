require 'minitest/autorun'
require 'active_record'
require 'database_cleaner'
require 'pry'

# TODO - require your models here, e.g.
require_relative '../models/author'

class MiniTest::Test
  def setup
    ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database => 'test/test.db'
    )

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end