require_relative 'helper'

describe "Comments" do

  before do
    @post = create(:post)
    @post.comments.create(:body => Faker::Lorem.paragraph)
  end

  it "should send me a txt when someone leaves a msg" do
    SendSms.history.length.must_equal 1
  end
end
