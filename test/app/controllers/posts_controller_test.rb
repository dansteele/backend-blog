require File.expand_path(File.dirname(__FILE__) + '/../../test_config.rb')

describe "/posts" do
  before do
    @author = create(:author)
    @author.posts << build(:post, :title => "I love nesting restful resources")

    create(:post, :title => "I shouldn't appear")

    get "/authors/#{@author.id}/posts"
  end

  it "should return hello world text" do
    last_response.body.must_match(/nesting/)
    last_response.body.wont_match(/appear/)
  end
end
