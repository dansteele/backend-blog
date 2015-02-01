require 'minitest/autorun'
require 'date'
require 'active_record'
require 'database_cleaner'
require 'pry'
require 'factory_girl'
require 'faker'
require_relative 'factories'

# TODO - require your models here, e.g.


# require_relative '../migrations/create_author'
# require_relative '../migrations/create_comment'
# require_relative '../migrations/create_image'
# require_relative '../migrations/create_post'
# require_relative '../migrations/create_post_tag'
# require_relative '../migrations/create_tags'

class MiniTest::Test
  include FactoryGirl::Syntax::Methods
  def setup
    ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database => './db/development.sqlite3'
    )
    require_relative '../models/author'
    require_relative '../models/post'
    require_relative '../models/comment'
    require_relative '../models/image'
    require_relative '../models/post_tag'
    require_relative '../models/tag'
    require_relative '../models/send_sms'

    DatabaseCleaner.strategy = :truncation, { :cache_tables => false } 
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end