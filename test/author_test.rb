require_relative 'helper'
require 'pry'

describe "Authors" do

  before do

    # CreateAuthor.new.up
    # CreateComment.new.up
    # CreateImage.new.up
    # CreatePost.new.up
    # CreatePostTag.new.up
    # CreateTag.new.up


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

    #binding.pry
  end

  it "deal with authors" do
    assert_equal 1, Author.count
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
    # CreateAuthor.new.down
    # CreateComment.new.down
    # CreateImage.new.down
    # CreatePost.new.down
    # CreatePostTag.new.down
    # CreateTag.new.down
  end
end

describe "validations" do
  before do 
    @author = Author.new
    @post = Post.new
    @tag = Tag.new
  end

  it "should validate the name" do
    @author.valid?
    @author.errors[:name].must_include "can't be blank"
  end

  it "should validate the name is > 10 chars" do
    @author.name = "hi"
    @author.valid?
    @author.errors[:name].must_include "is too short"
  end

  it "should check that twitter starts with @ symbol" do 
    @author.twitter = "dan"
    @author.valid?
    @author.errors[:twitter].must_include "@"
  end

  it "should check email is > 5 letters and contains @" do
    @author.email = "danno"
    @author.valid?
    @author.errors[:email].must_include "short"
    @author.errors[:email].must_include "@"
  end


  it "should check that the author's age is over 21 and < 65" do
    @author.dob = Date.new(1995,02,12)
    @author.valid?
    @author.errors[:dob].must_include "young"
    @author.dob = Date.new(1920,1,1)
    @author.valid?
    @author.errord[:dob].must_include "old"
  end


  it "should require a title and body > 20 words on post" do
    @post.valid?
    @post.errors[:title].must_include "required"
    @post.errors[:body].must_include "short"
  end

  it "should require 'name' on tag" do
    @tag.valid?
    @tag.errors[:name].must_include "required"
  end

  it "should make sure tag.name is one of 'Ruby, Rails, Databases, OOP, Patterns'" do
    @tag.name = "PHP"
    @tag.valid?
    @tag.errors[:name].must_include "list"
  end

  it "should confirm acceptance of T&Cs" do
    @author.tc = false
    @author.valid?
    @author.errors[:tc].must_include "accept"
  end

  it "should confirm passwords match" do
    @author.password1 = "lolz"
    @author.password2 = "lolx"
    @author.valid?
    @author.errors[:password1].must_include "not match"
  end

end