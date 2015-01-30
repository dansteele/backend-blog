require 'active_record'
require 'pry'
require_relative '../models/author'
require_relative '../models/comment'
require_relative '../models/image'
require_relative '../models/post'
require_relative '../models/post_tag'
require_relative '../models/tag'

#binding.pry

user = Author.find_or_create_by_name(:name => "Dan",
 :twitter => "@dansteele")

user.posts << Post.find_or_create_by_title(:title => "We got coders",
  :body => "This place is awesome")

puts "HERE IS THE POST #{user.posts}"