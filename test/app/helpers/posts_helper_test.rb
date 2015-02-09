require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

require "pry"

describe "BackendBlog::App::PostsHelper" do
  before do
    @helpers = Class.new
    @helpers.extend BackendBlog::App::PostsHelper
  end

  def helpers
    @helpers
  end

  it "should return nil" do
    assert_equal nil, helpers.foo
  end
end
