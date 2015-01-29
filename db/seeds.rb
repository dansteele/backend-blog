require 'active_record'
require_relative '../models/author'
require_relative '../models/comment'
require_relative '../models/image'
require_relative '../models/post'
require_relative '../models/post_tag'
require_relative '../models/tag'

author = Author.find_or_create_by_name!(:name => "Dan",
 :twitter => "@dansteele")

author << Post.find_or_create_by_name!(:title => "We got coders",
  :body => "This place is awesome")