require 'minitest/autorun'
require 'active_record'
require 'database_cleaner'
require 'pry'

# TODO - require your models here, e.g.
require_relative '../models/user'
require_relative '../models/post'
require_relative '../models/comment'
require_relative '../models/image'
require_relative '../models/post_tag'
require_relative '../models/tag'

require_relative '../migrations/create_user'
require_relative '../migrations/create_comment'
require_relative '../migrations/create_image'
require_relative '../migrations/create_post'
require_relative '../migrations/create_post_tag'
require_relative '../migrations/create_tags'

class MiniTest::Test
  def setup
    ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database => './database.db'
    )

    DatabaseCleaner.strategy = :truncation, { :cache_tables => false } 
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end