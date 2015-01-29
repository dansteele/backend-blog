require_relative 'helper'
require 'pry'

describe "Authors" do

  before do
    @author = Author.new(:name => "Bob", :twitter => "@bob" )
    @tag = Tag.new(:name => "Ruby")
    @post = Post.new(:body => "Hello", :title => "My first blog",
      :author_id => @author.id)
    @comment = Comment.new(:body => "This system sucks", :kudos => 0,
      :author_id => @author.id, :post => @post)
    @image = Image.new(:url => "google.com", :caption => "awesome caption",
      :filesize => 1024, :post_id => @post.id)
    

    @author.save!
    @tag.save!
    @post.save!
    @comment.save!
    @image.save!


    @post.tags << @tag

    @author.reload
    @comment.reload
    @image.reload
    @tag.reload
    @post.reload

    binding.pry
  end

  it "deal with authors" do
    assert_equal 1, Author.count
  end

  it "deal with comments" do
    assert_equal 2, Comment.count
  end

  it "deal with images" do
    assert_equal 1, Image.count
  end
  
  it "deal with tags" do
    assert_equal 1, Tag.count
  end

  it "deal with posts" do
    assert_equal 1, Post.count
  end
end