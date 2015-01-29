require_relative 'helper'
require 'pry'

describe "Users" do

  before do

    CreateUser.new.up
    CreateComment.new.up
    CreateImage.new.up
    CreatePost.new.up
    CreatePostTag.new.up
    CreateTag.new.up


    @user = User.new(:name => "Bob", :twitter => "@bob" )
    @tag = Tag.new(:name => "Ruby")
    @post = Post.new(:body => "Hello", :title => "My first blog",
      :user_id => @user.id)
    @comment = Comment.new(:body => "This system sucks", :kudos => 0,
      :user_id => @user.id, :post => @post)
    @image = Image.new(:url => "google.com", :caption => "awesome caption",
      :filesize => 1024, :post_id => @post.id)
    

    @user.save!
    @tag.save!
    @post.save!
    @comment.save!
    @image.save!


    @post.tags << @tag

    @user.reload
    @comment.reload
    @image.reload
    @tag.reload
    @post.reload

    #binding.pry
  end

  it "deal with users" do
    assert_equal 1, User.count
  end

  it "deal with comments" do
    assert_equal 1, Comment.count
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

  after do
    CreateUser.new.down
    CreateComment.new.down
    CreateImage.new.down
    CreatePost.new.down
    CreatePostTag.new.down
    CreateTag.new.down
  end
end